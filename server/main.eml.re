let greet = (js, num) => {
  <html>
  <script type="text/javascript"><%s! js %></script>
  <body>
    <h1>Good morning, World!</h1>
    <p><%s num %></p>
  </body>
  </html>
};


let () = {

  let script = ref("");
  /* TODO: improve read of JS file */
  switch (open_in("./server/JS/min.js")) {
  | exception (Sys_error(msg)) => {
     print_endline(msg ++ "\n" ++ "ensure to run make pui first")
     exit(-1);
  }
  | file_in_channel =>
    /* read the first line off that input channel */
    script := input_line(file_in_channel);
    close_in(file_in_channel);
  };

  Dream.run(~interface="0.0.0.0")
  @@ Dream.logger
  @@ Dream.router([

    Dream.get("/",
      (_ => Dream.html(greet(script^,  BL.Bl.example())))),

  ]);
}
