//: [Previous](@previous)

import Foundation

//제네릭 - 한 메서드의 타입을 타입 파라미터로 지정 햐여 여러 타입으로 사용할 수 있도록 하는 것

//제네릭 함수
func Text<T>(_ a: T,_ b: T){
    print("첫번째 : \(a) 두번째 : \(b)")
}

var text = "가나다"
var text1 = "라마바"
var number = 1
var number1 = 2
var floatNumber = 3.14
var floatNumber1 = 6.28

Text(text,text1)
Text(number,number1)
Text(floatNumber,floatNumber1)


//Text(text,number) //에러 - T가 첫번째 파라미터인 String형태로 대체 되었기 때문에 Int형인 다음 파라미터는 불가
//두개를 같이 쓰기 위해서는 타입 파라미터의 개수를 늘리면 된다
//대체적으로 타입 파라미터의 이름은 대문자,단일 문자로 통용(가독성 떄문)
//func Text<T,V>(_ a: T,_ b: V){
//    print("첫번째 : \(a) 두번째 : \(b)")
//}
//Text(text,number)

//제네릭 타입
struct arr<T>{
    var val : [T] = []
    init(_ val : [T]) {
        self.val = val
    }
}


let arrText = arr(["가","나","다"])
let arrNum = arr([1,2,3])
print(arrText)
print(arrNum)

//참고로 배열도 제네릭 타입이라고 함

//타입 제약

//제네릭을 사용할 때 특정 타입이나 특정 프로토콜만 사용할 수 있도록 제약을 둘 수 있음

//프로토콜 제약

//func isSameValues<T>(_ a: T, _ b: T) -> Bool {
//    return a == b
//}  에러
func isSameValues<T: Equatable>(_ a: T, _ b: T) -> Bool {
    return a == b
}
//a와 b가 == 을 사용할 수 없는 타입일 수도 있으니까 Equatable 프로토콜을 준수 할 수 있는 타입만 사용할 수 있게 됨


//클래스 제약

class N{}
class NT:N{}
class ST{}

func mbti<T:N>(_ n : T){
    print(n)
}
//여러 제약을 추가 하고 싶으면 wher T: 'protocal'을 추가하면 됨
//N클래스와 N클래스에게 상속 받지 않은 클래스로부터 제약을 걸 수 있다.
let enfj = N.init()
let entj = NT.init()
//let istj = ST.init()

mbti(enfj)
mbti(entj)
//mbti(istj)



