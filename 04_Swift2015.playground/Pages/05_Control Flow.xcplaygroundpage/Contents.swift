//: [Previous](@previous) | [Next](@next)


//: ## Control Flow
//:
//: Use `if` and `switch` to make conditionals, and use `for`-`in`, `for`, `while`, and `repeat`-`while` to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//im Prinzip range 
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")
// prints "3 to the power of 10 is 59049"

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print(name)
}

var airports: [String:String] = [
    "YYZ":"Toronto Pearson",
    "DUB": "Dublin Airport",
    "LHR": "London Heathrow"]
for (aircode, name) in airports {
    print("\(aircode)    \(name)")
}

//: Iterating
let airPortCodes = [String](airports.keys)

// airportCodes is ["YYZ", "LHR"]


let airPortValues = [String](airports.values)

// airportNames is ["Toronto Pearson", "London Heathrow"]

for airportname in airports.keys { //bzw. values
    print("\(airportname)")
}

// Airport code: YYZ
// Airport code: LHR



//: In an `if` statement, the conditional must be a Boolean expression—this means that code such as `if score { ... }` is an error, not an implicit comparison to zero.
//:
//: You can use `if` and `let` together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains `nil` to indicate that a value is missing. Write a question mark (`?`) after the type of a value to mark the value as optional.
//:
var optionalGreeting:String? = "Hallo"
print(optionalGreeting)

//so kann ich dem Compiler sagen das die Variable auch null sein kann


var name:String? = "Andy"
var nachname:String? = "W"

if let name = name,// != null
    //greifen nur zu wenn es diese Variable wirklich gibt
    //kann den gleichen Namen verwenden da der vordere Name nur in der Schleife bekannt ist
    
    
    greeting = optionalGreeting {
        
    print("\(optionalGreeting) \(name)")
    "Hallo \(name) \(nachname ?? "ubekannt")"
        
} else {
    print("Alles doof ohne Andy ")
}


//: > **Experiment**:
//: > Change `optionalName` to `nil`. What greeting do you get? Add an `else` clause that sets a different greeting if `optionalName` is `nil`.
//:
//: If the optional value is `nil`, the conditional is `false` and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after `let`, which makes the unwrapped value available inside the block of code.
//:
//: Another way to handle optional values is to provide a default value using the `??` operator. If the optional value is missing, the default value is used instead.
//:
let nickName: String? = nil
let fullName: String = "Andreas Wittmann"


//: Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.
//:
let vegetable = "red pepper"

switch vegetable {
case "gurke":
    print("toll eine gurke")
case "cucumter", "watermelon":
    print("du bist eine wassermelone oder ein gurke")
case let x where x.hasSuffix("pepper"):
    print("it is spicy \(x)")
default:
    print("keine Ahnung was es ist")
}

//: > **Experiment**:
//: > Try removing the default case. What error do you get?
//:
//: Notice how `let` can be used in a pattern to assign the value that matched that part of a pattern to a constant.
//:
//: After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of each case’s code.
//:


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String!


switch approximateCount {
case 0:
        naturalCount = "no"
case 1..<5:
    naturalCount = "einpaar"
case 5..<12:
    naturalCount = "ein dutzend"
default:
    naturalCount = "nein"
}


print("There are \(naturalCount) \(countedThings).")
// prints "There are dozens of moons orbiting Saturn."


//: You use `for`-`in` to iterate over items in a dictionary by providing a pair of names to use for each key-value pair. Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
//:
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0


for (kind, numbers) in interestingNumbers {
    print("kind \(kind)")
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

//: > **Experiment**:
//: > Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
//:
//: Use `while` to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
//:
var n = 2

while  n < 100 {
    n = n * 2
}

print(n)

var m = 2
repeat {
m = m * 2
} while < 100
print(m)

//: You can keep an index in a loop—either by using `..<` to make a range of indexes or by writing an explicit initialization, condition, and increment. These two loops do the same thing:
//:
var firstForLoop = 0

for i in 0...4 {
    print("> \(i)")
}

print(firstForLoop)

var secondForLoop = 0

for var j = 0; j <= 4; ++j {
    print("+ \(j)")
}

print(secondForLoop)

//: Use `..<` to make a range that omits its upper value, and use `...` to make a range that includes both values.
//:


//: Control Transfer Statements
/*:
 * * continue
 * * break
 * * fallthrough
 * * return
 * * throw
*/
//: Early Exit Guard

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("hallo \(name)")
    
    guard let location = person["location"] else {
        print("\(name) hat keine location ende")
        return
        }
    print("location \(location)")
}

greet(["name": "John"])
// prints "Hello John!"
// prints "I hope the weather is nice near you."
greet(["name": "Jane", "location": "Cupertino"])
// prints "Hello Jane!"
// prints "I hope the weather is nice in Cupertino."


//: difference guard & let
func awesomeFunctionWithGuard(name:String?) {
    guard let name = name else {
        print("kein Name")
        return
    }
    print("All good \(name)")
}

func awesomeFunctionWithLet(name:String?) {
    if let name = name {
        print("All good \(name)")
        return
    }
    print("kein Name")
    // this won't work – name doesn't exist here!
    //print("Your username is \(name)")
}

//: Checking API Availability
if #available(iOS 9, OSX 10.10, *) {
    // Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X
} else {
    // Fall back to earlier iOS and OS X APIs
}



/*:
largely Based of [Apple's Swift Language Guide: Control Flow](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
