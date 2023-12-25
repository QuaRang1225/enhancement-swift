//: [Previous](@previous)



//생성자는 클래스가 객체(인스턴스)화 될때 실행되는 메서드이다.
//자바처럼 클래스이름과 동일해야하지 않으며 init()으로 통일한다 물론 오버로딩도 가능
//해제자는 생성자와 반대로 객체가 필요없어질 때 실행되는 메서드 deinit으로 사용
import Foundation

class Hi{
    var hello:String
    init() {
        hello = "안녕하세여"
    }
    deinit {
        print("Hi클래스가 소멸되었습니다.")
    }
}

var greeting:Hi? = Hi() //옵셔널로 선언
print(greeting!.hello)
sleep(1)
greeting = nil  //값이 소명하여 deinit을 호출

struct Translator{
    
    var text:String
    
    init(english:String){
        text =  "\(english)는 영어로 bye"
    }
    init(_ japanese:String){
        text =  "\(japanese)는 일본어로 こんにちは"
    }
    
}
let translationEnglish = Translator(english: "잘가")  //각자의 생성자 호출가능
let translationJapanese = Translator("안녕")  //_로 구분지어서 호출가능 
print(translationEnglish)
print(translationJapanese)
//: [Next](@next)

