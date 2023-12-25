//: [Previous](@previous)

import Foundation
//조건문
//if문
var grade = 4     //자료형 생략 가능

if grade > 3 && grade <= 6{     //연산자와 숫자를 붙여놓으면 오류가 남
    print("고학년입니다")
}
else if grade >= 1 && grade <= 3{
    print("저학년입니다")
}
else {
    print("초등학생이 아닌데요..?")
}

var boy:Bool = true

if boy {    //true일 경우 간단식 false일경우 !boy
    print("남자입니다")
}else{
    print("여자입니다")
}
var gender : Void = !boy ? print("남자입니다") : print("여자입니다")
//삼항 연산자로 바로 표현 가능

//switch문
switch grade {      //a..<b는 a와 b사이의 있는 모든수를 뜻함
case 1 ..< 4 :
    print("저학년")
case 4 ..< 7 :
    print("고학년")
default :
    print("초등학생이 아닌데요..?")
}

//반보문
//for문

//0...5
//0,1,2,3,4,5

//0..<5
//0,1,2,3,4

let i:Int
let j:Int
//for문 별찍기
for i in 1...5{             //i를 굳이 사용하지 않고 단순반복문만 사용하고 싶으면 _를 i 대신에 써줄 수 있다.
    for j in 1...i{
        print("*",terminator: "")
    }
    print("")
}
var ranInt:[Int] = [Int]()

for _ in 0..<25{
    let ranNum = Int.random(in: 0...100)        //랜덤수를 생성하여 프로퍼티에 저장
    ranInt.append(ranNum)           //배열에 랜덤 프로퍼티값을 저장
}
print("랜덤한 수 : ",ranInt)

var arr : [Int] = [1,2,3,4,5,6,7,8,9,10]

for i in arr where i % 2 == 0 {     //where이 붙으면 조건 첨가 가능
    print("짝수 : \(i)")
}

//while문
 





