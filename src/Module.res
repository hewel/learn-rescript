module Foo = {
  type house = BigHouse | SmallHouse | RichHouse
  let myHouse = SmallHouse

  let getHouseName = house =>
    switch house {
    | SmallHouse => "Small House"
    | BigHouse => "Big House"
    | _ => "Rest House"
    }
}
open Foo

let yourHouse: house = RichHouse
Js.log(Foo.getHouseName(yourHouse))
let _ = Foo.getHouseName(yourHouse)

let map = (_arr, value) => {
  value
}

open! Js_array2

let _ = map([1, 5], Js.log)

module User = {
  let user1 = "Anna"
  let user2 = "Franz"
}

// Destructure by name
let {user1, user2} = module(User)

// Destructure with different alias
let {user1: anna, user2: franz} = module(User)

module BaseComponent = {
  let defaultGreeting = "Hello"
  let getAudience = (~excited) => excited ? "world!" : "world"
}

module ActualComponent = {
  /* the content is copied over */
  include BaseComponent
  /* overrides BaseComponent.defaultGreeting */
  let defaultGreeting = "Hey"
  let render = () => defaultGreeting ++ " " ++ getAudience(~excited=true)
}

/* Picking up previous section's example */
module type EstablishmentType = {
  type profession
  let getProfession: profession => string
}

module type Comparable = {
  type t
  let equal: (t, t) => bool
}

module type MakeSetType = (Item: Comparable) =>
{
  type backingType
  let empty: backingType
  let add: (backingType, Item.t) => backingType
}

module MakeSet: MakeSetType = (Item: Comparable) => {
  // let's use a list as our naive backing data structure
  type backingType = list<Item.t>
  let empty = list{}
  let add = (currentSet: backingType, newItem: Item.t): backingType =>
    // if item exists

    if Belt.List.has(currentSet, newItem, Item.equal) {
      currentSet // return the same (immutable) set (a list really)
    } else {
      list{newItem, ...currentSet} // prepend to the set and return it
    }
}

module IntPair = {
  type t = (int, int)
  let equal = ((x1: int, y1: int), (x2, y2)) => x1 == x2 && y1 == y2
  let create = (x, y) => (x, y)
}

/* IntPair abides by the Comparable signature required by MakeSet */
module SetOfIntPairs = MakeSet(IntPair)
