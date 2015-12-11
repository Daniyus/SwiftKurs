//: [Previous](@previous) | [Next](@next)


//: Definition Syntax

// structure definition goes here
struct MeineStructur {
    
}

// class definition goes here
class MeineKlasse {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class Videomode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    var resolution = Resolution()
}

//: Class and Structure Instances
let someResolution = Resolution()
let someVideomode = Videomode()
//: Memberwise Initializers for Structure Types
let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)

var cinema = hd
cinema.height
cinema.width
//:Structures and Enumerations Are Value Types
/*:
A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.

You’ve actually been using value types extensively throughout the previous chapters. In fact, all of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.
*/
cinema.width = 2048
cinema.width

hd.width
// prints "cinema is now 2048 pixels wide"
//:However, the width property of the original hd instance still has the old value of 1920:
hd.width
// prints "hd is still 1920 pixels wide

//same behavior applies to enumerations

enum CompassPoint {
    case North, South, East, West
}

var aktuelleRichtung = CompassPoint.West
var dasMerkeIchMirDaWillIchHin = aktuelleRichtung

aktuelleRichtung = .East
dasMerkeIchMirDaWillIchHin

// prints "The remembered direction is still .West"


//: Classes Are Reference Types

//bei structur wird eine Kopie erstellt
//bei class wird eine Referenz erstellt

let tenEighty = Videomode()

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let fourK = Videomode()

fourK.resolution = hd
fourK.interlaced = true
fourK.name = "1080i"
fourK.frameRate = 25.0


//wegen dieser Verbindung ändern sich die Werte wenn ich es beim einen ändere auch beim anderen
let auchEinAnderer4KMonitor = fourK
let einAnderer1080Monitor = tenEighty


einAnderer1080Monitor.frameRate = 70
auchEinAnderer4KMonitor.frameRate = 69

tenEighty.frameRate
einAnderer1080Monitor.frameRate

fourK.frameRate
auchEinAnderer4KMonitor.frameRate
// prints "The frameRate property of tenEighty is now 30.0"


//:Identity Operators

// prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
if tenEighty === einAnderer1080Monitor {
    print("ja zeigen beide auf die gleiche VideoMode instance")
} else {
    print("ne sind unterschiedlich, zeigt woanders hin")
}
//3 = bedeuten ob Sie auf die selbe Identität zeigen (Zeiger gleich)
/*:
largely Based of [Apple's Swift Language Guide: Classes And Strucs](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82 ) & [Apple's A Swift Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1 )
*/
//: [Previous](@previous) | [Next](@next)
