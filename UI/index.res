@val 
external 
addEventListener: (
    string, 
    (Dom.event => bool)
) => () = "addEventListener"


let start = () => Js.log(Bl.example());


addEventListener("load", (_) => {
    start();
    true
})