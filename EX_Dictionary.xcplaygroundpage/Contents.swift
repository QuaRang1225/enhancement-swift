//: [Previous](@previous)

import Foundation
//딕셔너리
//기본 형태 [키:값]
//값은 중복될 수 있지만 키는 중복 불가능
var firePokemon:[String:Int] = [:]  //빈 딕셔너리 초기화
var waterPokemon = Dictionary<String,Int>() //이것도 가능
//딕셔너리도 제네릭형태
var grassPokemon = ["이상해씨":1,"치코리타":2,"나무지기":3]
//타입추론가능

let chikorita = grassPokemon["치코리타"]
print("치코리타는 \(chikorita!)세대 포켓몬이다")       //딕셔너리는 기본반환값이 optional 타입이기 때문에 언래핑을 해줘야함

//let jojo = grassPokemon["죠죠"]   //nil
let jojo = grassPokemon["죠죠",default: 0 ]   //없는 값이 들어오면 기본값을 0으로 하겠다
print("죠죠는 \(jojo)세대? 포켓몬이다")
//딕셔너리의 키값은 꼭 Hashable 프로토콜을 준수하는 타입만 사용할 수 있음 ex)Any

print(grassPokemon.isEmpty)     //딕셔너리가 비었는지 판단
print(grassPokemon.count)       //딕셔너리의 개수 출력

//딕셔너리 추가 방법 키값이 존재할 경우 값만 덮어쓰게 됨
firePokemon["파이리"] = 1      //서브스크립트
firePokemon.updateValue(2, forKey: "브케인")

firePokemon["파이리"] = nil    //서브스크립트
firePokemon.removeValue(forKey: "브케인")
firePokemon.removeAll() //전체삭제




//: [Next](@next)
