//: [Previous](@previous)

import Foundation
//프로퍼티 옵져버

var number = 0{
    willSet{
        print("값이 설정될 예정 nuber : \(number)")
    }
    didSet{
        print("값이 설정됨 nuber : \(number)")
    }
}
number = 10
number = 20

//: [Next](@next)
class StepCounter {
    
    var totalSteps: Int = 1000 {  //저장 프로퍼티
        //프로퍼티 옵저버
        willSet {
            print("totalSteps을 \(totalSteps)에서 \(newValue)로 설정하려고 합니다")
            
        }
        didSet {
            if totalSteps > oldValue  {
                print("\(totalSteps - oldValue)걸음이 추가되었습니다.")
            }
        }
    }
}
 
let myStepCounter: StepCounter = StepCounter()
//willSet은 값이 저장되기 직전에 호출
//totalSteps을 1000에서 10000로 설정하려고 합니다
myStepCounter.totalSteps = 10000
//didSet은 값이 저장된 직후에 호출
//9000걸음이 추가되었습니다.
