let greet = (who, num) => {
  <html>
  <body>
    <h1>Good morning, <%s who %>!</h1>
    <p><%s num %></p>
  </body>
  </html>
};


let () =
  Dream.run(~interface="0.0.0.0")
  @@ Dream.logger
  @@ Dream.router([

    Dream.get("/",
      (_ => Dream.html(greet("Utopia",  BL.Bl.example())))),

  ]);
