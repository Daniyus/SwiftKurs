//: [Previous](@previous) | [Next](@next)

//: Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let lenght: Int
}

var instanz = FixedLengthRange(firstValue: 0, lenght: 3)
instanz.firstValue = 6

// the range represents integer values 0, 1, and 2
// the range now represents integer values 6, 7, and 8


//: Stored Properties of Constant Structure Instances

// this range represents integer values 0, 1, 2, and 3
//rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property

//instanz.lenght = 6

//: Lazy Stored Properties
//: You must always declare a lazy property as a variable (with the var keyword)

class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    // the DataImporter class would provide data importing functionality here
    var fileName = "data.txt"
    
}

class DataManager {
    // the DataManager class would provide data management functionality here
    lazy var importer = DataImporter() //erzeugt erst die Instanz wenn sie gebraucht wird
    var data = [String]()
    
}

let manager = DataManager()
manager.data.append("Tolle Daten")
manager.data.append("Tolle Daten2")
manager.data.append("Tolle Daten3")
manager.importer.fileName


// the DataImporter instance for the importer property has not yet been created

//: Computed Properties


struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    //origin
    //size
    var origin = Point()
    var size = Size()
    
    var center :Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}


var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))


square.center

// prints "square.origin is now at (10.0, 10.0)"

square.center = Point(x: 15, y: 15 )
square.origin

//: Shorthand setter
struct Rect2 {
    //origin
    //size
    var origin = Point()
    var size = Size()
    
    var center :Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: Read-Only Computed Properties
//: You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value is not fixed.


// prints "the volume of fourByFiveByTwo is 40.0"

//: Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            //wird aufgerufen kurz bevor der neue Wert den alten überschreibt
            print("About ot set totalSteps to \(newValue)")
        }
        didSet {
            //wird aufgerufen kurz nachdem der neue Wert den alten überschreibt
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

//: static
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
    
    
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// prints "7"

// prints "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// prints "10"
AudioChannel.maxInputLevelForAllChannels
// prints "10"
leftChannel.currentLevel
/*:
largely Based of [Apple's Swift Language Guide: Properties](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID254 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
