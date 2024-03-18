//import UIKit
//
//
//func a() async -> Int {
//    return 1
//}
//func b() async -> Int{
//    return 2
//}
//func c(a:Int,b:Int) async{
//    print(a+b)
//}
//
//Task{
//    let A = await a()
//    let B = await b()
//    await c(a: A, b: B)
//}

import Foundation


//Dispatch Queue 생성
/*
여기서 Dispatch Queue란?
java,C등에서는 스레드를 생성하기 위해 명시적으로 스레드를 만들고 해야할 작업을 생성한 스레드에 지정해주는 작업이 필요했음
멀티 스레딩 환경이 복잡하고 어려우며 리소스 관리를 직접 해줘야하는 등 단점이 있었음

 그래서 나온 것이 Dispatch Queue임
 작업(Dispatch Queue 옵션)을 정의해 Dispatch Queue에 명시만 해주면 알아서 적절한 스레드에 할당하게 됨
 */

let concurrntQueue = DispatchQueue(label: "concurrntQueue",attributes: .concurrent)
//concurrent - 동시
let serialQueue = DispatchQueue(label: "SerialQueue")
//serial - 직렬



let group = DispatchGroup()
//let queue = DispatchQueue.global()
//print("1")
//queue.async{
//    print("2")
//}
//sleep(1)
//print("3")

// 명령어 라인
func performTask(taskNumber: Int) {
    print("Task \(taskNumber) 인출")
    sleep(1)
    print("Task \(taskNumber) 해석")
    sleep(1)
    print("Task \(taskNumber) 실행")
    sleep(1)
    print("Task \(taskNumber) 저장")
    sleep(1)
}

// 병렬 처리할 작업 개수
//let numberOfTasks = 5

//sync - 동기
//async - 비동기
//작업 시작
//print(Thread.main)
//for i in 1...numberOfTasks {
//    serialQueue(group:.none){
//        performTask(taskNumber: i)
//    }
//    concurrntQueue.async {
//        performTask(taskNumber: i)
//    }
//}
//print(Thread.main)



//let timeoutResult = group.wait(timeout: .now() + 3)

//for i in 1...numberOfTasks {
//    concurrntQueue.async(group:group){
//        performTask(taskNumber: i)
//    }
//}



//===============특정 그룹의 작업이 끝날때까지 block상태
//group.wait()
//let timeer = group.wait(timeout: .now() + 3)

//그룹에서의 task 작업시간이 3초가 되었을때 정지를 풀고 해당 성공과 실패를 확인할 수 있음
//만약 작업의 범위가 3초보다 오래걸려도 다른 스레드에서 이어서 계속 진행됨

//switch timeer{
//case .success:
//    print("3초 안에 task 완료 성공")
//case .timedOut:
//    print("3초 초과")
//}
//print("ddddd")




//=========해당 그룹의 작업이 끝나고 나면 실행될 내용 클로져로 전달
//queue의 종류를 선택할 수 있음
//group.notify(queue: concurrntQueue){
//    print("asdad")
//}




//========enter&leave
//Dispatch 그룹안에 작업은 모두 동기적으로 작동됨
//Dispatch 그룹안의 작업이 비동기로 실행될 경우, 그작업이 끝나기도 전에 그룹의 종료가 되는 문제가 발생함
//예를 들어 스레드 1에서 2로 비동기 코드를 보내면 스레드 2의 종료시점은 무시하고 스레드1의 종료시점만을 인식함
//궁금점 - 스레드2는 같은 Dispatch그룹을 사용하는지 맞다면, 종료시점은 스레드2도 같은 그룹이니 상관이 없는것은 아닌지
//코드에 enter와 leave를 삽입하면 비동기 코드의 시작과 끝을 그룹이 인식할 수 있게 됨

//print("시작")
//serialQueue.sync {
//    group.enter()
//    concurrntQueue.async{
//        sleep(5)
//        print(1)
//        group.leave()
//    }
//    group.enter()
//    concurrntQueue.async{
//        //defer - 자동적으로 현재 스코프의 마지막에 실행됨
//        defer{
//            group.leave()
//        }
//        sleep(6)
//        print(2)
//        
//    }
//}
//
//
//group.notify(queue:serialQueue){
//    print("끝")
//}


//===========DispatchWorkItem
//queue에서 실행시킬 작업들을 인스턴스화 시킬 수 있음
let workItemA = DispatchWorkItem{
    print("시작")
    print("끝")
}
let workItemB = DispatchWorkItem{
    print("start")
    print("end")
}
//concurrntQueue.async(execute: workItemA)
//workItemA.cancel()  //작업실행전 : 테스크를 큐에서 삭제 시킴, 작업 실행 중 : 작업이 멈추진 않고 isCaencelled가 true로 설정됨
//workItemB.notify(queue: concurrntQueue, execute: workItemA) //작업 B가 끝난 후, 작업A가 특정 큐에서 실행되도록 지정

