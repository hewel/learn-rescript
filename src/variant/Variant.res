type myResponse =
  | Yes
  | No
  | PrettyMuch

let areYouCrushingIt = Yes

let pet: Zoo.animal = Dog
let pet2 = Zoo.Cat

type account =
  | None
  | Instagram(string)
  | Facebook(string, int)

let myAccount = Facebook("Joe", 123)
let friendAccount = Instagram("Jenny")

type user =
  | Number(int)
  | Id({name: string, age: int, password: string})

let me = Id({name: "Joe", age: 23, password: "123"})
