//: [Previous](@previous)

import Foundation

//상속
//자바랑 비슷한 개념

class Charizard{
    
    var type:String
    
    init(_ type : String) {
        self.type = type
    }
    func typeName(_ pokemon:String){
        print("\(pokemon)의 타입은 \(self.type)이다.")
    }
}
class CharizardX : Charizard{
    
    override init(_ type : String) {    //오버라이딩
        super.init(type + ",비행")
    }
    override func typeName(_ pokemon:String){
        super.typeName(pokemon)
    }
}
let charizard = Charizard("불꽃")
charizard.typeName("리자드")
let charizardX = CharizardX("불꽃")
charizardX.typeName("리자몽")
//: [Next](@next)
