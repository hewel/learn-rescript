let expensiveFilesRead = lazy {
  Js.log("Reading dir")
  Node.Fs.readdirSync("./pages")
}

Js.log(Lazy.force(expensiveFilesRead))
Js.log(Lazy.force(expensiveFilesRead))

let result = try {
  Lazy.force(expensiveFilesRead)
} catch {
| Not_found => [] // empty array of files
}
Js.log(result)
