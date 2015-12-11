//: [Previous](@previous) | [Next](@next)


//: Instance Methods
class Counter {
    var count = 0
    
    //increment
    func increment() {
        count += 1
    }
    
    func increment2(value:Int = 1) {
        count += value
    }
    //incrementby
    func incrementby(value: Int) {
        count += value
    }
    //reset
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
counter.count
// the counter's value is now 1
counter.incrementby(5)
counter.count
// the counter's value is now 6
counter.reset()
counter.count
// the counter's value is now 0


//: Local and External Parameter Names for Methods
extension Counter {
    func incrementBy(amount: Int, numberOfTime: Int) {
        count += amount + numberOfTime
    }
}

// counter value is now 15

//:self
struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOfX(x:Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)


somePoint.isToTheRightOfX(1.0)

//if //
//print("This point is to the right of the line where x == 1.0")


//: Modifying Value Types from Within Instance Methods
//: Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
//: mutating for the rescue
struct Point2 {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(3.0, deltaY: 4.0)
somePoint2.moveBy(3.0, deltaY: 4.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
// prints "The point is now at (3.0, 4.0)"


//: Type Methods (class methods)
struct LevelTracker {
    
    
    var currentLevel = 1
    
    mutating func advanceToLevel(level:Int) -> Bool {
        currentLevel = level
        if LevelTracker.isLevelUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
    static var highestUnlockLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockLevel {
            highestUnlockLevel = level
        }
    }
    
    static func isLevelUnlocked(level:Int) -> Bool {
        return level <= highestUnlockLevel
    }
    
}


class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    init(name: String) {
        playerName = name
    }
    func completedLevel(level: Int) {
        tracker.advanceToLevel(level + 1)
        LevelTracker.unlockLevel(level + 1)
    }
}


var player = Player(name: "Andy")
player.completedLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockLevel)")
LevelTracker.highestUnlockLevel
// prints "highest unlocked level is now 2"

player = Player(name: "Flori")
player.completedLevel(5)
LevelTracker.highestUnlockLevel

//if
//    print("player is now on level 6")
//} else {
//    print("level 6 has not yet been unlocked")
//}
// prints "level 6 has not yet been unlocked"

/*:
largely Based of [Apple's Swift Language Guide: Methods](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Methods.html#//apple_ref/doc/uid/TP40014097-CH15-ID234 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
