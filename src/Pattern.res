let coordinates = (10, 20, 30)
let (x, _, _) = coordinates
Js.log(x) // 10

// Record
type student = {name: string, age: int}
let student1 = {name: "John", age: 10}
let {name} = student1 // "John" assigned to `name`

type result = Success(string)
let displayMessage = (Success(m)) => {
  // we've directly extracted the success message
  // string by destructuring the parameter
  Js.log(m)
}
displayMessage(Success("You did it!"))

type payload =
  | BadResult(int)
  | GoodResult(string)
  | NoResult

let data = GoodResult("Product shipped!")
let noResult = NoResult
switch data {
| GoodResult(theMessage) => Js.log("Success! " ++ theMessage)
| BadResult(errorCode) =>
  Js.log("Something's wrong. The error code is: " ++ Js.Int.toString(errorCode))
| NoResult => Js.log("Bah.")
}

type status = Vacations(int) | Sabbatical(int) | Sick | Present
type reportCard = {passing: bool, gpa: float}
type person =
  | Teacher({name: string, age: int})
  | Student({name: string, status: status, reportCard: reportCard})

let person1 = Teacher({name: "Jane", age: 35})
let passed = true
let message = switch person1 {
| Teacher({name: "Mary" | "Joe"}) => `Hey, still going to the party on Saturday?`
| Teacher({name}) =>
  // this is matched only if `name` isn't "Mary" or "Joe"
  `Hello ${name}.`
| Student({name, reportCard: {passing, gpa}}) if passing === passed =>
  `Congrats ${name}, nice GPA of ${Js.Float.toString(gpa)} you got there!`
| Student({reportCard: {gpa: 0.0}, status: Vacations(daysLeft) | Sabbatical(daysLeft)}) =>
  `Come back in ${Js.Int.toString(daysLeft)} days!`
| Student({status: Sick}) => `How are you feeling?`
| Student({name}) => `Good luck next semester ${name}!`
}

switch person1 {
| Teacher(_) => () // do nothing
| Student({reportCard: {gpa}}) if gpa < 0.5 => Js.log("What's happening")
| Student(_) =>
  // fall-through, catch-all case
  Js.log("Heyo")
}
