//: [Previous](@previous)

import Foundation

//inout - 매개변수를 수정 할수 있게 해주는 키워드
let pikachu = "피카츄"

//pikachu = "도치마론"    //에러

func firePokemon(_ pokemon:String){
    print("불꽃타입 포켓몬 : \(pokemon)")
}
//func waterPokemon(_ pokemon:String){
//    pokemon = "물타입 포켓몬 : " + pokemon    //에러
//    print(pokemon)
//}
func waterPokemon(_ pokemon: inout String){ //inout 사용
    pokemon = "물타입 포켓몬 : " + pokemon    //에러
    print(pokemon)
}
firePokemon("푸호꼬")
var froakie = "개구마르"    //그냥 값만 넣을 수 없음으로 새 변수를 만들어 저장한 뒤 사용
waterPokemon(&froakie)  //let으로 선언하면 오류가 남

func swap(_ a:inout Int ,_ b: inout Int){
    
    print("변경 전 a : \(a) b: \(b)")
    var tmp = a
    a = b
    b = tmp
    print("변경 후 a : \(a) b: \(b)")
}
var a = 3
var b = 4
swap(&a,&b)

//inout의 원리
//1. 함수가 호출되면, 매개변수로 넘겨진 변수가 복사된다.
//2. 함수 몸체에서, 복사한 값을 수정한다.
//3. 함수가 반환될 때, 변화된 값을 원본 변수에 재할당한다.

var str2 = """
This goes \
over multiple \
lines
"""
var burns = """
The best laid schemes
O’ mice and men
Gang aft agley
"""

print(str2)
print(burns)
