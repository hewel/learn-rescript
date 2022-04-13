@unboxed
type name = Name(string)
let studentName = Name("Joe")

@unboxed
type greeting = {message: string}
let hi = {message: "hello!"}

type coordinates = {x: float, y: float}
@unboxed type localCoordinates = Local(coordinates)
@unboxed type worldCoordinates = World(coordinates)

let renderDot = (World(coordinates)) => {
  Js.log3("Pretend to draw at:", coordinates.x, coordinates.y)
}

let toWorldCoordinates = (Local(coordinates)) => {
  World({
    x: coordinates.x +. 10.,
    y: coordinates.x +. 20.,
  })
}

let playerLocalCoordinates = Local({x: 20.5, y: 30.5})

// This now errors!
// renderDot(playerLocalCoordinates)
// We're forced to do this instead:
playerLocalCoordinates->toWorldCoordinates->renderDot->Js.log
