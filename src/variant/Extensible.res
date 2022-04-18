type t = ..

type t += Other

type t +=
  | Point(float, float)
  | Line(float, float, float, float)

let print = v =>
  switch v {
  | Point(x, y) => Js.log2("Point", (x, y))
  | Line(ax, ay, bx, by) => Js.log2("Line", (ax, ay, bx, by))
  | Other
  | _ =>
    Js.log("Other")
  }

let add = %raw("(a, b) => a + b")
%%raw("const a = 1")
