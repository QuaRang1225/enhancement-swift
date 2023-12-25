//: [Previous](@previous)

import Foundation

//class Alphabet{
//    func a(){
//        print("a")
//    }
//    func b(){
//        print("b")
//    }
//}
//extension Alphabet{
//    func c(){
//        print("c")
//    }
//}
//let useAlpabet:Alphabet = .init()
//useAlpabet.a
//useAlpabet.b
//useAlpabet.c
let point:CGPoint = .init(x: 10, y: 20)
let num:Int = 5

extension CGPoint{
    func printPoint() {
            print("x: \(self.x), y: \(self.y)")
        }
}

point.printPoint()


extension Int {
    var double: Int {
        return self * 2
    }
}
print(num.double)

extension Int{
    func scription(){
        print("정수형 클래스입니다.")
    }
}

num.scription()

struct Alphabet{
    var a:Int
    var b:Int
}

extension Alphabet{
    init(v:Int){
        self.a = v
        self.b = v
    }
}

let alpha:Alphabet = .init(v: 3)
print(alpha)




