//: [Previous](@previous) | [Next](@next)
import UIKit

//: Setting Initial Values for Stored Properties
struct Fahrenheit {
    var temperature: Double

    init() {
        temperature = 32
    }
}

var f = Fahrenheit()
f.temperature
// prints "The default temperature is 32.0° Fahrenheit"



//: Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(_ celsius:Double){
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0
let bodyTemperature = Celsius(37.0)

// bodyTemperature.temperatureInCelsius is 37.0


//: Optional Property Types
class SurveyQuestion {
    var text:String
    var response:String?
    
    init(text:String) {
        self.text = text
    }
    
    func ask() -> String {
        return text
    }
}

let q1 = SurveyQuestion(text: "Do you like cheese?")
q1.ask()

q1.response = "Ja"
q1.response
// prints "Do you like cheese?"


//: Default Initializers
class ShoppingListItemDefault {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItemDefault()

//: Class Inheritance and Initialization

/*:
Initializer Delegation for Class Types

To simplify the relationships between designated and convenience initializers, Swift applies the following three rules for delegation calls between initializers:

* Rule 1
A designated initializer must call a designated initializer from its immediate superclass.

* Rule 2
A convenience initializer must call another initializer from the same class.

* Rule 3
A convenience initializer must ultimately call a designated initializer.

A simple way to remember this is:
* Designated initializers must always delegate up.
* Convenience initializers must always delegate across.
*/

class Food {
    var name: String
    init(name:String){
        self.name = name
    }
    
    convenience init() {
        self.init(name:"Essen ohne Name")
    }
}

let f1 = Food()
let f2 = Food(name: "Pizza")

[#Image(imageLiteral: "initializerDelegation01_2x.png")#]
[#Image(imageLiteral: "initializerDelegation02_2x.png")#]


[#Image(imageLiteral: "initializersExample01_2x.png")#]

// namedMeat's name is "Bacon"
let f3 = Food()
let f4 = Food(name: "Bacon")

// mysteryMeat's name is "[Unnamed]"

class ReceiptIngredient :Food {
    var quantity: Int
    
    init(name: String, quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    convenience override init(name:String){
        self.init(name: name, quantity: 1)
    }
    
}


var r1 = ReceiptIngredient()
var r2 = ReceiptIngredient(name: "Pizza")
var r3 = ReceiptIngredient(name: "Egg", quantity: 5)

[#Image(imageLiteral: "initializersExample02_2x.png")#]

[#Image(imageLiteral: "initializersExample03_2x.png")#]

class ShoppingListItem: ReceiptIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔": " ✘"
        return output
    }
}


var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]



breakfastList.append(ShoppingListItem(name: "Orange Juice"))

for item in breakfastList{
    print(item.description)
}

// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘


//: Failable Initializers



// someCreature is of type Animal?, not Animal
/*
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
*/
// prints "An animal was initialized with a species of Giraffe"

// anonymousCreature is of type Animal?, not Animal

/*
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
*/
// prints "The anonymous creature could not be initialized"


//: Required Initializers


/*:
largely Based of [Apple's Swift Language Guide: Initialization](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
