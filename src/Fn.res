let greet = name => "Hello " ++ name
Js.log(greet("world!"))

let add = (. ~x, ~y, ~z) => x * x + y * y + z
Js.log(add(. ~x=1, ~z=2, ~y=3))

let greetMore = name => {
  let part1 = "Hello"
  part1 ++ " " ++ name
}

type color = [#red | #green | #blue]
type radius = option<int>

let setColor = color => {
  Js.log(color)
}
let startAt = (x, y) => {
  Js.log2(x, y)
}

let drawCircle = (~color: color, ~radius: radius=?, ()) => {
  setColor(color)
  switch radius {
  | None => startAt(1, 1)
  | Some(r_) => startAt(r_, r_)
  }
}
let payloadRadius: radius = Some(10)
let result = drawCircle(~color=#red, ~radius=?payloadRadius, ())

// Recursively check every item on the list until one equals the `item`
// argument. If a match is found, return `true`, otherwise return `false`
let rec listHas = (list, item) =>
  switch list {
  | list{} => false
  | list{a, ...rest} => a === item || listHas(rest, item)
  }

let rec callSecond = () => callFirst()
and callFirst = () => callSecond()

let times = (x, y) => x * y
let a = times(2)(3)

let echo = (. a) => a

echo(. ignore())
