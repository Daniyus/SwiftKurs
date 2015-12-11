//: [Previous](@previous) | [Next](@next)


//: Fun Fact: Swift’s String type is bridged with Foundation’s NSString class. If you are working with the Foundation framework in Cocoa, the entire NSString API is available to call on any String value you create when type cast to NSString, as described in AnyObject. You can also use a String value with any API that requires an NSString instance.


//: String Literals
let someString = ""//"Some string literal value"

  //  someString += "Toll"

if someString.isEmpty {
    print("someString enthält leider noch nichts")
}

// these two strings are both empty, and are equivalent to each other


// variableString is now "Horse and carriage"


// this reports a compile-time error - a constant string cannot be modified

//: Strings Are Value Types
for char in "Dog!🐶".characters {
    print(char)
}
var dog = "Dog!🐶"


//: String Interpolation
print("somestring enthält \(someString) noch \(4 + 5 + 5) nichts ")

//: Counting Characters

// prints "unusualMenagerie has 40 characters"


//: Character access

// G
    dog[dog.startIndex]
// !
    dog[dog.endIndex.predecessor()]
    dog[dog.startIndex.successor()]

    let index = dog.startIndex.advancedBy(3)
    dog[index]

// u

// a


//: Comparing Strings

//if "dog" == "dog"
// prints "These two strings are considered equal"

//: Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0


//hasprefix
//hassuffix
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet´s mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence´s cell") {
        ++cellCount
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


/*:
largely Based of [Apple's Swift Language Guide: Strings And Characters](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)

