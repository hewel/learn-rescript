@inline
let mode = "dev"

let mode2 = mode

@@warning("-27")

@unboxed
type a = Name(string)

@val external message: string = "message"

type student = {
  age: int,
  @as("aria-label") ariaLabel: string,
}

@deprecated
let customDouble = foo => foo * 2

@deprecated("Use SomeOther.customTriple instead")
let customTriple = foo => foo * 3

let baa: student = {
  age: 1,
  ariaLabel: "a",
}
