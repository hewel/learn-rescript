let personHasACar = true
let licenseNumber = if personHasACar {
  Some(5)
} else {
  None
}

switch licenseNumber {
| None => Js.log("The person doesn't have a car")
| Some(value) => Js.log("The person's license number is " ++ Js.Int.toString(value))
}
let x = Some(None)

@module("MyIdValidator") external validate: Js.Nullable.t<string> => bool = "validate"
let personId: Js.Nullable.t<string> = Js.Nullable.return("abc123")

let result = validate(personId)
