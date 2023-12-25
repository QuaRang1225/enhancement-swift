//: [Previous](@previous)

import Foundation

struct Info {
    var name: String = "콰랑"
    var age: Int = 24
}
 
//let myInfo: Info = Info(name: "콰랑", age: 24)
 
class YourInfo {
    lazy var myinfo: Info = Info()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let weInfo: YourInfo = YourInfo(name: "깨랑")
print(weInfo.myinfo.name)    //사용 시에만 호출
print(weInfo.name)      //myinfo를 사용하지 않으므로 호출 안됨

struct CoordinatePoint {
    var x: Int = 1
    
    var oppositePoint: CoordinatePoint { //연산 프로퍼티
        get { //접근자
            return CoordinatePoint(x: -x)
        }
        
        set(oppsite) { //설정자
            x = -oppsite.x
        }
    }
}
 
var SeogunPosition: CoordinatePoint = CoordinatePoint()
print(SeogunPosition.x) // x: 1
print(SeogunPosition.oppositePoint.x) //x: -1
 
// 설정자 x = -oppsite.x이기 때문에 접근 가능
// 대칭 좌표를 20 으로 설정하면
SeogunPosition.oppositePoint = CoordinatePoint(x: 20)
// 현재 좌표는 -20 으로 설정된다
print(SeogunPosition.x) // x: -20
