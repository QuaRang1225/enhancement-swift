import UIKit
import Darwin

//클로저 - 익명함수
//클로저 안에 이름이 있는 메서드와 없는 메서드가 있는데 보통 이름이 없는 메서드를 클로저라고 부름

let closure = {print("안녕하살법")}  //프로퍼티안에 저장가능
closure()

let greeting = { () -> () in    //클로저 선언 방법
    print("안녕하세기")
}
greeting()

let MBTI = {(mbti: String)->String in       //파라미터와 반환타입이 존재하는 클로저
    return  "내 MBTI는 \(mbti)야"
}
print(MBTI("ENTJ"))

func Family(people: ()->()) {       //함수의 파라미터를 클로저로 선언
        people()
}
Family(people: {()->() in           //메서드 호출처럼 호출
    print("우리 가족은 5명이야")
})

({()->() in                     //일회성으로 클로저를 호출할 수 있다.
    print("우리는 강아지를 키워")
})()

func FamilyMBTI(dad: (String)->(), mom: (String)->()) {     //파라미터가 여러개인 함수 클로저 호출하는 방법
    mom("ENFJ")
    dad("ISTJ")
}

FamilyMBTI(dad: { (mbti : String)->() in
    print("우리 아빠의 MBTI는 \(mbti)야")
}, mom:{ (mbti: String)->() in
    print("우리 엄마의 MBTI는 \(mbti)야")
})

//인라인 클로저 - ()로 구분짓는 클로저, 위의 내용은 모두 인라인 클로저
//트레일링 클로저 - 함수의 마지막 파라미터가 클로저일 경우 함수형식이 아닌 함수 뒤에 붙여 사용하는 문법
//파라미터가 클로저 하나일 경우 마지막 파라미터이기 때문에 사용가능 파라미터 이름은 생략 가능
//파라미터의 이름과 타입, 반환 타입, in까지 모두 생략가능
// ex) func ex(closure,closure)  ->  ex(closure){}

func Dog(kong: ()->()){
    kong()
}

Dog{
    print("강아지 이름은 콩이야")
}

//Dog(kong: {()->() in
//    print("강아지 이름은 콩이야")
//})

func Family(people: (Int)->(),puppy: ()->()) {       //함수의 파라미터를 클로저로 선언
        people(5)
        puppy()
}
Family(people: {(num: Int)->() in           //메서드 호출처럼 호출
    print("우리 가족은 \(num)명이야")
}){                                         //()->() in 삭제 가능
    print("화목한 가족이야")
}

func sum(num:(Int,Int,Int)->(Int)){
    print(num(1,2,3))
}
sum(num: {(a:Int,b:Int,c:Int)->Int in
    return a+b+c
})
//트레일링 클로저에서는 파라미터이름,타입,() 모두 생략 가능
sum{ (a,b,c)->(Int) in
    return a+b+c
}
//in과 반환 타입을 파라미터 값 모두 삭제할 수 없지만 파라미터가 여러개이다 물론 이것도 생략은 가능하다
//파라미터가 여러개면 $와 주소값으로 파라미터의 주소로 대체 할수 있다.
sum{            //파라미터 값과 반환 타입, in 생략
    $0+$1+$2     //$0은 첫번째 주소       //return 조차 삭제 가능 단, 단일 리턴문이여야 한다
}

//위의 가족MBTI코드에 트레알링 클로저 적용
func FamilyMBTI(firstSister: (String)->(), secondSister: (String)->()) {     //파라미터가 여러개인 함수 클로저 호출하는 방법
    firstSister("ISFJ")
    secondSister("ISTJ")
}
FamilyMBTI(firstSister: { (mbti : String)->() in
    print("우리 첫째여동생의 MBTI는 \(mbti)야")
}){
    print("우리 둘째여동생의 MBTI는 \($0)야")
}

//오토클로저(autoclosure) - 파라미터로 전달된 일반구문/함수를 클로저로 래핑하는 것

func sub(_ num: @autoclosure ()->()){
    num()
}
//앞에 @autoclosure를 붙여 준다
//리턴타입은 상관없지만 무조건 파라미터 타입은 void여야만 함
//실제로 클로저를 받지 않아도 클로저처럼 사용 가능
//클로저가 실제로 실행될 떄까지 실행되지 않음
//코드를 간결하게 만들 수 있음

sub(print(5-1))   //클로저로 만들어져도 일반 구문 또는 함수도 적용 가능
//sub({
//  print(5-1)
//})

func canOptinal(sentence:(()->Void)? = nil){
    print("못불러옵니다")
    sentence?()
}
//옵셔널로 선언할 경우에 클로저를 호출할수도 있고 안할 수도 있음
canOptinal()

canOptinal{
    print("하지만 불러 올수도 있습니다")
}
