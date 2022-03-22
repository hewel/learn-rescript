type red = [#Ruby | #Redwood | #Rust]
type blue = [#Sapphire | #Neon | #Navy]

// Contains all constructors of red and blue.
// Also adds #Papayawhip
// type color = [red | blue | #Papayawhip]

let render = myColor => {
  switch myColor {
  | #...red => Js.log("Your color is red")
  | #...blue => Js.log("Your color is blue")
  | other => Js.log2("Other colors ", other)
  }
}

type preferredColors = [#white | #blue]
let myColor: preferredColors = #white
let displayColor = v => {
  switch v {
  | #red => "Hello red"
  | #green => "Hello green"
  | #white => "Hey white!"
  | #blue => "Hey blue!"
  }
}
let user = #Facebook("Josh", 23)
Js.log(displayColor(myColor))

type t

@scope("Intl") @val
external makeNumberFormat: [#"de-DE" | #"en-GB" | #"en-US"] => t = "NumberFormat"

let intl = makeNumberFormat(#"de-DE")

let foreground: [> #red] = #green
let background: [< #Red | #Blue] = #Red

type basicBlueTone<'a> = [< #Blue | #DeepBlue | #LightBlue] as 'a
type color = basicBlueTone<[#Blue | #DeepBlue]>

let color: color = #Blue

type company = [#Apple | #Facebook]
let theCompany: company = #Apple
let message = "Hello " ++ (theCompany :> string)
