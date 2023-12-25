//: [Previous](@previous)

import Foundation
import UIKit

print("========== struct ===========")

struct FruitStruct{
    var apple:String
    var banana:String
}
var color = FruitStruct(apple:"빨간색",banana:"노란색")
var appleColor = color
print(appleColor.apple)
appleColor.apple = "초록색"
print(appleColor.apple)
print(color.apple)


struct Info1 {
    var name: String  //저장 프로퍼티
    var age: Int  //저장 프로퍼티
    var weight:Int?
}
 
//구조체에는 기본적으로 저장프로퍼티 매개변수를 갖는 이니셜라이저가 있음
let mylInfo: Info1 = Info1(name: "콰랑", age: 24, weight: 999 )
print(mylInfo.weight!)

print("========== class ===========")

class FruitClass{
    var apple:String
    var banana:String
    //생성자
    init(_ apple:String,_ banana:String) {
        self.apple = apple
        self.banana = banana
    }
}
var color1 = FruitClass("빨간색","노란색")
var bananaColor = color1
print(bananaColor.banana)
bananaColor.banana = "연두색"
print(bananaColor.banana)
print(color1.banana)

class Info2 {
    
    var name: String
    let age: Int
    var weight:Int?
    
    // 프로퍼티 기본값이 없으면 이니셜라이저를 정의해야함
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
//사용자 정의 이니셜라이저를 사용해야 초깃값을 할당 할 수 있음
let myInfo1: Info2 = Info2(name: "콰랑", age: 24)
myInfo1.weight = 999
print(myInfo1.weight!)


//struct와 class의 차이
//struct는 값형이고 class는 참조형이다
//struct는 복사를 하여 사용할 경우 값이 복사가 됨으로 복사한 값에 영향을 끼치지 않지만 class는 메모리만 복사할 뿐 실제 위치는 같으므로 값이 공유가 된다
//둘다 프로퍼티를 선언할 수 있고 메서드를 선언할 수 있다.




