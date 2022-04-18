type request
@val external asyncRequest: unit => request = "asyncRequest"
@send external setWaitDuration: (request, int) => request = "setWaitDuration"
@send external send: request => unit = "send"

asyncRequest()->setWaitDuration(4000)->send

let result = [1, 2, 3]->Js.Array2.map(a => a + 1)->Js.Array2.filter(a => mod(a, 2) == 0)

@module("path") @variadic
external join: array<string> => string = "join"

let _ = join(["1", "2", "5"])

@module("Drawing") external drawCat: unit => unit = "draw"
@module("Drawing") external drawDog: (~giveName: string) => unit = "draw"

let _ = drawDog(~giveName="hi")->drawCat

@val
external padLeft: (
  string,
  @unwrap
  [
    | #Str(string)
    | #Int(int)
  ],
) => string = "padLeft"

let _ = padLeft("Hello World", #Int(4))
let _ = padLeft("Hello World", #Str("Message from ReScript: "))
