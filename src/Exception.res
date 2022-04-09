let getItem = items =>
  if Array.length(items) > 0 {
    // return the found item here
    items[1]
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
