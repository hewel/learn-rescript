let myArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let firstItem = myArray[0]
myArray[0] = 10

let pushedValue = Js.Array.push(88, myArray)

let myList = list{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
let anotherList = list{0, ...myList}

let message = switch myList {
| list{} => "This list is empty"
| list{a, ..._rest} => "The head of the list is the string " ++ Js.Int.toString(a)
}
