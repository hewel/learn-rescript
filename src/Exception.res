let getItem = items =>
  if false {
    // return the found item here
    1
  } else {
    raise(Not_found)
  }

let result = try {
  getItem([1, 2, 3])
} catch {
| Not_found => 0 // Default value if getItem throws
}

exception BadArgument({myMessage: string})

let myTest = () => {
  raise(BadArgument({myMessage: "Oops!"}))
}
