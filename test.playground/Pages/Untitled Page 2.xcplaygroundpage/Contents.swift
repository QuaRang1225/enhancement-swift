//: [Previous](@previous)

import Foundation

class Count{
    static let shared = Count()
    var num = 0
    func countNum(){
        num += 1
        print(num)
    }
}
func call1(){
    Count.shared.countNum()
}
func call2(){
    Count.shared.countNum()
}
func call3(){
    Count.shared.countNum()
}
call1()
call2()
call3()
