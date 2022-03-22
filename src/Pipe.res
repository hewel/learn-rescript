type request
@val external asyncRequest: unit => request = "asyncRequest"
@send external setWaitDuration: (request, int) => request = "setWaitDuration"
@send external send: request => unit = "send"

asyncRequest()->setWaitDuration(4000)->send

let result = [1, 2, 3]->Js.Array2.map(a => a + 1)->Js.Array2.filter(a => mod(a, 2) == 0)
