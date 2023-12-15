import Foundation
import SwiftUI

//func printString(){
//    print("1")
//    play {
//        print("끝")      //completion 터진시점
//    }
//    print("3")
//}
//func play(completion: @escaping () -> Void){
//    DispatchQueue.main.async{
//        print("2")
//        completion()
//    }
//}
//printString()


func asyncPrintString(){
    Task{
        print("시작")
        await asyncPlay()   //스레드 제어권 시스템에게 넘어감
        print("끝")
    }
}
func asyncPlay() async{
    print("행동")
}
asyncPrintString()
