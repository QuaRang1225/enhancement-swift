
import Foundation

//옵셔넝 - 값이 존재할 수도 안할 수도 있는것

var val:Int?    //보통은 초기화를 시켜야 하지만 옵셔널로 선언하면 초기화를 하지 않아도 에러가 발생하지 않음
//초기화를 따로 하지 않으면 nil값이 저장됨
val = 3
print(val)      //옵셔널 변수이기 때문에 래핑된 상태로 출력 되게 됨
print(val!)     //강제로 옵셔널을 벗길 수 있음(강제 언래핑)      //좋은 방법은 아님

//옵셔널 바인딩
if let unwrapVal = val{
    print(unwrapVal)
}

val = nil
let numVal = val ?? 30  //변수 안에 값이 nil일 경우 값을 넣어줌
print(numVal)

var fristVal:Int? = 11
var secondVal:Int? = nil

func unWrap(_ param: Int?){
    guard let unwrapVal = param else{
        print("참이 아님")
        return
    }
    print(unwrapVal)
}
unWrap(fristVal)
unWrap(secondVal)


//옵셔널 체이닝 - 옵셔널을 사슬처럼 연달아서 사용하는 것
struct Information {
    var grade : Int
    var major : String
}

struct Student {
    var name : String
    var info : Information
    
    init(_ name : String, _ grade : Int, _ major : String) {
        self.name = name
        info = Information(grade  : grade, major : major)
    }
}
var quarang : Student? = Student("콰랑", 1, "스위프트학과")
//변수를 옵셔널로 선언한 후 구조체 저장

//my = nil
if let myname = quarang?.name, let myinfo = quarang?.info{
    print("나는 \(myinfo.grade)학년 \(myinfo.major) \(myname)입니다.")
}else{
    print("존재하지 않는 학생입니다.")
}

var readText = readLine()!
var setText = readText.components(separatedBy: " ")

var a = Int(setText[0])!
var b = Int(setText[1])!
print(a - b)







