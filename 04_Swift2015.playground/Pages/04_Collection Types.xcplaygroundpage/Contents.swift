//: [Previous](@previous) | [Next](@next)
import UIKit

//: Reminder

[#Image(imageLiteral: "CollectionTypes_intro_2x.png")#]



var array = ["Six Eggs", "Milk", "Flour", "Baking Powder", "Bananas"]
//Ein Wert nur einmal speicherbar
var setExample:Set = ["Rock", "Jazz", "Jazz", "Classical", "Hip Hop"]
//wie Set nur gibt den Werten noch Namen
var dict:[String:String] = [
    "YYZ":"Toronto Pearson",
    "DUB": "Dublin Airport",
    "LHR": "London Heathrow"]


//: Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
//:

var emptyArray = [String]()
var emptyDict = [String:String]()

emptyArray = []
//emptyDict = [:]

array[1]
array[2]
array[4]

dict["DUB"]
dict["LHR"]
dict["TollerKey"]

var threeDoubleValues:[Double] = [Double](count: 10, repeatedValue: 5.0)
var anotherDoubleValues:[Double] = [Double](count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubleValues + anotherDoubleValues
//: To create an empty array or dictionary, use the initializer syntax.
//:

//: If type information can be inferred, you can write an empty array as `[]` and an empty dictionary as `[:]`—for example, when you set a new value for a variable or pass an argument to a function.
//:


//: Creating an Array with a Default Value

// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]


// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


// prints "The shopping list is not empty."




// shoppingList now contains 4 items
// shoppingList now contains 7 items


// firstItem is equal to "Eggs"

sixDoubles = []
sixDoubles.append(7.0)
sixDoubles += [2.0]
sixDoubles += [5.0, 7.0]

if sixDoubles.isEmpty {
    print("no values")
} else {
    print("alles gut")
}

array[0]

array.append("Sugar")
// shoppingList now contains 6 items




//: Iterating Over an Array

var shoppinglist = array
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
for (index, item) in shoppinglist.enumerate() {
    print("Item \(index + 1): \(item)")
}


// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas

//: Sets


var favoriteGenres = setExample
["Rock", "Classical", "Hip hop"]
["Rock", "Classical", "Hip hop"]

let netGenre:Set = ["Rock 2"]
favoriteGenres.insert("Rock2")

    print("I have \(favoriteGenres.count) favorite music genres.")


//print("I have \(favoriteGenres.count) favorite music genres.")

//print("I have \(favoriteGenres.count) favorite music genres.")

//print("I have \(favoriteGenres.count) favorite music genres.")

//print("I have \(favoriteGenres.count) favorite music genres.")





//: Set operations
[#Image(imageLiteral: "setVennDiagram_2x.png")#]
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.union(evenDigits).sort()
// []

oddDigits.exclusiveOr(oddDigits)
oddDigits.intersect(evenDigits)
// [1, 9]

oddDigits.subtract(singleDigitPrimeNumbers)
// [1, 2, 9]
oddDigits.exclusiveOr(singleDigitPrimeNumbers)

let houseAnimals: Set = [                  "🐶", "🐱"]
let farmAnimals: Set =  ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set =  ["🐦", "🐭"]

//isSubsetof
//isSuperSetof
//isDisjointWith


// true
houseAnimals.isSubsetOf(farmAnimals)

farmAnimals.isSupersetOf(houseAnimals)

farmAnimals.isDisjointWith(cityAnimals)
// true


//: Dictionaries
var airports: [String: String] = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin"]

//as always: isEmpty && count

print("Anzahl Aiports \(airports.count)")
print("Leer ? \(airports.isEmpty)")

let air = airports["DUB"]
print(air)

airports["DUB"] = "Berlin"
airports["DUB"]

// prints "The airports dictionary is not empty."


airports.removeValueForKey("DUB")








/*:
largely Based of [Apple's Swift Language Guide: Collection Types](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
