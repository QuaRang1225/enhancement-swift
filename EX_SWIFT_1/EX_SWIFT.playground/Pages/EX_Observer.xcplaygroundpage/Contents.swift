//: [Previous](@previous)

import Foundation
//프로퍼티 옵져버

var number = 0{
    willSet{
        print("값이 설정될 예정 nuber : \(number)")
    }
    didSet{
        print("값이 설정됨 nuber : \(number)")
    }
}
number = 10
number = 20

//: [Next](@next)
