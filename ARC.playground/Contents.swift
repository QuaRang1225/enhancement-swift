import UIKit

var greeting = "Hello, playground"

class Qurang{
    var name:String = ""
    var age:Int = 0
    var bro = PCY()
}

class PCY{
    var name:String = ""
    var age:Int = 0
    var bro = Qurang()
}

let quarang = Qurang()
let pcy = PCY()

print(greeting)
//print(quarang)
//let a :CFTypeRef = quarang as AnyObject
//print(CFGetRetainCount(a))
