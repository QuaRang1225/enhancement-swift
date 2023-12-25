//: [Previous](@previous)

import Foundation

class Info{
    let name = "콰랑"
    var greeting:String{
        return "안녕하세요. 저는 " + name + "이라고 합니다."
    }
}
class InfoType{
    static let name = "콰랑"
    static var greeting:String{
        return "안녕하세요. 저는 " + name + "이라고 합니다."
    }
}

print(InfoType.name)
print(InfoType.greeting)
//접근 시 타입 이름으로만 접근 가능

class Name{
    class var name:String{  //class 키워드 대신 static을 사용하면 오버라이딩이 안됨
        return "내 이름은 콰랑입니다."
    }
}
class NickName:Name{
    override class var name:String{
        return "내 별명은 멋쟂이입니다."
    }
}
print(Name.name)
print(NickName.name)


