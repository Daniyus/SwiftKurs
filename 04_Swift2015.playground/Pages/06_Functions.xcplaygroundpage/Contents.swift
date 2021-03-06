//: [Previous](@previous) | [Next](@next)

//: ## Functions and Closures
//:
//: Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.
//:


// prints "Hello again, Anna!"

func sayHelloToName(name:String) -> String {
    return "Hallo \(name)"
}
print(sayHelloToName("Andy"))
// prints "Hello Bob, today is Tuesday."
func sayHelloToName(name:String, day:String) -> String {
    return "Hallo \(name), heute ist \(day)"
}
print(sayHelloToName("Veronika", day:"Donnerstag"))
//beim ersten brauch man kein Parameter, nur bei allen weiteren

func sayHelloToName(name:String, day:String, _ third:Int) -> String {
    return "Hallo "
}

// _ heist ist nicht notwendig
//Man kann nach dem Index einen Namen schreiben und ihn dann innerhalb der func verwenden


//: > **Experiment**:
//: > Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:


//: Specifying External Parameter Names & Omitting External Parameter Names

// prints "Hello Bill and Ted!"

//: Functions with Multiple Return Values
//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var summe = 0
    var min = scores[0]
    var max = scores[0]
    
    for score in scores {
        summe += score
        if score < min {
            min = score
        }
        if score > max {
            max = score
        }
    }
    return (min, max, summe)
    
    //if scores.isEmpty {
    //    return(0, 0, 0)
    //}
    
    //return( scores.minElement()!, scores.maxElement()!, scores.)
    
    
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
print(statistics.max)

//: Variadic Parameters
//: Functions can also take a variable number of arguments, collecting them into an array.
//:
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(42, 5, 60)
//: > **Experiment**:
//: > Write a function that calculates the average of its arguments.
//:
//: Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
//:
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


//: inout
func swapTwoInts(inout a:Int, inout _ b:Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3"


//: Function Types
//: Functions are a first-class type. This means that a function can return another function as its value.
//:

func isLessThanTen(number:Int) -> Bool {
    return number < 10
}

func verrueckteMAtheFormel(number:Int) ->Bool {
    return number > 10
}

isLessThanTen(5)
isLessThanTen(15)
var numbers = [5,13,34,3]
 
func executeFunctionONTheseNumbers(list:[Int], condition: (Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
executeFunctionONTheseNumbers(numbers, condition: isLessThanTen)
executeFunctionONTheseNumbers(numbers, condition: verrueckteMAtheFormel)
//: A function can take another function as one of its arguments.
//:
//fuckingclosuresyntax.com :D
var numbers1 = [20, 19, 7, 12]

numbers1.map({
    (number:Int) -> Int in
    let result = 3 * number
    return result
})

let result = numbers1.map({ number in 3 * number})

print(result)
//doStuffFromAGivenMethod(numbers, condition: lessThanTen)

let result2 = numbers1.sort({$0 > $1})
/*: Currying
* one of those weird words you avoid because people who say it are sometimes jerks
* it is actually a preetty straightforward concept
* currying is a function that returns another function
* useful for sharing code that is mostly the same
Additional Info: https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html#//apple_ref/doc/uid/TP40014097-CH34-ID363
*/

func containsAtSign(string:String) -> Bool {
    return string.characters.contains("@")
}
containsAtSign("Toll")
containsAtSign("meineMail@Adresse.con")

var input: [String] = ["Six Eggs", "Mil@k", "Flour", "Bak@ing Powder", "Bananas"]

//: Before currying

/*:
largely Based of [Apple's Swift Language Guide: Functions](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
