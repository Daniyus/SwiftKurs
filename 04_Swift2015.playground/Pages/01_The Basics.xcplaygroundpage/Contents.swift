//: [Previous](@previous) | [Next](@next)

print("Hallo Würzburg 🌟")

// DAs ist ein Kommentar


/*
* Das auch!
*/

//MARK: Das ist meine Wichtige Section


//: ## Simple Values
//:
//: Use `let` to make a constant and `var` to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places.
//:
var myVariable = 42
myVariable = 50
let myConstant = 42

//let = Konstante
//myConstant = 32

var meinName = "Danial"
var myInt = 7


//: A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is an integer.
//:
//: If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitInt:Int = 70
let explicitDouble: Double = 70





//: > **Experiment**:
//: > Create a constant with an explicit type of `Float` and a value of `4`.
//:
//: Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
//:
let explicitfloat:Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//: > **Experiment**:
//: > Try removing the conversion to `String` from the last line. What error do you get?
//:
//: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. For example:
//:

let apples = 3
let oranges = 5
let appleSummary = "ich habe \(apples) Äpfel"
let orangesSummary = "ich habe \(oranges) Orangen"
//Alt + Shift + 7 = \

//: > **Experiment**:
//: > Use `\()` to include a floating-point calculation in a string and to include someone’s name in a greeting.
//:

let maximumNumberOfLogins = 10
var currentLoginCount = 0

currentLoginCount = 1
currentLoginCount++

currentLoginCount += 4



let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow🐶🐮"

 let string = "hallo  \(π) \(🐶🐮)"
print(string)


//: Printing Constants and Variables


//: semicolon

let 😡 = "face"; print(😡)

//MARK: syntax sugar


//: Bounds
UInt8.min
UInt8.max


//: Tuples

// Constructing a simple tuple
let tp1 = (2,3)
let tp2 = (2,3,4)
// Constructing a named tuple
let tp3 = (x:5,y:3)
// Different types
let tp4 = (name : "Danial", age: 21, pets: ["Hund", "Katze"])
//alt + 5 = [
//alt + 6 = ]
// Accessing tuple elements
tp1.1
tp2.2
tp3.y
tp4.pets

let (_, alter, _) = tp4
print ("mein Name \(meinName) -> \(tp4.name)")

//: Ignoring Values During Decomposition


//:Named Tuples
//: das Json des kleinen Mannes


//: Tuples in methods 
func origin() -> (Double, Double, Double)
{
    //...
    return (1.0, 2.0, 1.5)
}


/*:
largely Based of [Apple's Swift Language Guide: The Basics](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
