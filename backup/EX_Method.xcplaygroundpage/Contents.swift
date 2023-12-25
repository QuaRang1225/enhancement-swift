//: [Previous](@previous)

import Foundation

//인스턴스 메서드/타입 메서드
class QuaRAng{
    func printName(){
        print("안녕 난 콰랑이야")
    }
    static func printNickName(){
        print("안녕 난 멋쟁이야")
    }
}
var greeting:QuaRAng = .init()
greeting.printName()
QuaRAng.printNickName()



