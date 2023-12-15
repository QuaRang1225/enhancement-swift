//: [Previous](@previous)

import Foundation

class Length{
    subscript(sentence : String)->Int?{
        get{
            guard sentence.count > 0 else{
                return nil
            }
            let sentenceLength =  sentence.count
            return sentenceLength
        }
    }
}
let stringLength:Length = .init()
var word = "오스트랄로피테쿠스"
print("word의 길이는 \(stringLength[word]!)입니다.")
word = "dsa"
print("word의 길이는 \(stringLength[word]!)입니다.")

class Multiple{
    var num = [1,2,3,4,5,6,7,8,9]
    subscript(index:Int)->Int{
        get{
            return num[index-1]
        }
        set{
            num[index-1] = index * newValue
        }
    }
}
var a:Multiple = .init()
print(a[3])
a[3] = 6
print(a[3])

