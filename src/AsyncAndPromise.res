let p1 = Promise.make((resolve, _reject) => {
  // We use uncurried functions for resolve / reject
  // for cleaner JS output without unintended curry calls
  resolve(. "hello world")
})

let p2 = Promise.resolve("Hi")

exception MyOwnError(string)
let p3 = Promise.reject(MyOwnError("some rejection"))

open Promise
Promise.resolve("hello world")
->then(msg => {
  // then callbacks require the result to be resolved explicitly
  resolve("Message: " ++ msg)
})
->then(msg => {
  Js.log(msg)

  // Even if there is no result, we need to use resolve() to return a promise
  resolve()
})
->ignore // Requires ignoring due to unhandled return value
