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


//struct와 class의 차이
//struct는 값형이고 class는 참조형이다
//struct는 복사를 하여 사용할 경우 값이 복사가 됨으로 복사한 값에 영향을 끼치지 않지만 class는 메모리만 복사할 뿐 실제 위치는 같으므로 값이 공유가 된다
//둘다 프로퍼티를 선언할 수 있고 메서드를 선언할 수 있다.

//파이널 클래스



