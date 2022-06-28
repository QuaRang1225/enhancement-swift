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
let i:Int
let j:Int

for i in 0..<6{             //i를 굳이 사용하지 않고 단순반복문만 사용하고 싶으면 _를 i 대신에 써줄 수 있다.
    for j in 0..<i{
        print("*",terminator: "")
    }
    print("")
}
//for문 별찍기

//while문
var a:Int = 0

while a < 10{
    a += 1
    print(a)
}



