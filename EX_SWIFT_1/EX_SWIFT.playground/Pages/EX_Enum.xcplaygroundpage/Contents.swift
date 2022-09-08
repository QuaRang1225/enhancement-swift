//: [Previous](@previous)

import Foundation
import CoreGraphics

//enum(열거형)
//관련된 값으로 이루어진 그룹을 공통의형으로 선언하여 안전성을 보장하는 방법

enum Rainbow{           //스위프트의 열거형은 case별로 값을 할당하지 않아도 된다
    case red,orange,yellow,green,blue,indigo,purple
}
var FavoriteColor = Rainbow.red
FavoriteColor = .indigo     //위에서 선언 시 enum의 red로 초기화 했기 때문에 타입 추론으로 인하여 .indigo만 사용해도 가능
print("가장좋아하는 색은 \(FavoriteColor)")

enum Num:Int{
    case first = 1,second ,thrid
}

let ColorNum = Num.second.rawValue               //rawValue를 적어야 enum의 값을 출력할 수 있음
print("\(FavoriteColor)는 \(ColorNum)번째 색깔이다")
let color = Num(rawValue: 3)        //3을 가진 값을 저장 가능   //값이 없을 경우 nil이 저장됨
print(color!)

enum pNum:Double{
    case first = 1.0,second = 2.0 ,thrid = 3, four
}
print(pNum.four.rawValue)

enum RainbowTranslation {       //함수형 enum
    case red(name: String)
    case orange(name: String)
    case yellow(name: String)
    case green(name: String)
    case blue(name: String)
    case indigo(name: String)
    case purple(name: String)
    
    func color() {          //enum안에 함수 사용 가능
        switch self{        //자기 자신의 맴버에 특정값이 들어올 경우
        case .red(let name):
            print(name)
        case .orange(let name):
            print(name)
        case .yellow(let name):
            print(name)
        case .green(let name):
            print(name)
        case .blue(let name):
            print(name)
        case .indigo(let name):
            print(name)
        case let .purple(name):     //위랑 같은 경우
            print(name)
        }
    }
}

let KoreanColor = RainbowTranslation.yellow(name : "노란색")   //yellow 맴버의 값 전달
print(KoreanColor)
KoreanColor.color()


//재귀 열거자
//다른 열거 인스턴스를 관계값으로 가지는 열거형

enum Calculate {
    case num(Int)
    indirect case add(Calculate,Calculate)                  //만약 모든 열거형 맴버가 재귀열거자면 enum선언 때 indirect 사용 가능
    indirect case division(Calculate,Calculate)             //ex? enum indirect calculate{}
}
let num1 = Calculate.num(30)
let num2 = Calculate.num(6)
let sum = Calculate.add(num1,num2)
let result = Calculate.division(sum,Calculate.num(6))

func Cal(_ operation:Calculate)->Int{           //_를 사용하면 맴버이름 사용안 할 수 있음
    switch operation{
    case let .num(value):
        return value
    case let .add(num1,num2):
        return Cal(num1) + Cal(num2)
    case let .division(num1,num2):
        return Cal(num1) / Cal(num2)
    }
}
print(Cal(result))     //재귀 열거 때문에 알아서 모든 case문을 거치고 연산된 값으로 나옴
