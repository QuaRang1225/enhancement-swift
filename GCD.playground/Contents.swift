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
let numberOfTasks = 5


//sync - 동기
//async - 비동기
//작업 시작
print(Thread.main)
for i in 1...numberOfTasks {
//    serialQueue(group:.none){
//        performTask(taskNumber: i)
//    }
    concurrntQueue.async {
        performTask(taskNumber: i)
    }
}
print(Thread.main)


let group = DispatchGroup()
let timeoutResult = group.wait(timeout: .now() + 3)

for i in 1...numberOfTasks {
//    concurrntQueue.async(group:group){
//        performTask(taskNumber: i)
//    }
}
//특정 그룹의 작업이 끝날때까지 block상태
//group.wait()
let timeer = group.wait(timeout: .now() + 3)

//그룹에서의 task 작업시간이 3초가 되었을때 정지를 풀고 해당 성공과 실패를 확인할 수 있음
//만약 작업의 범위가 3초보다 오래걸려도 다른 스레드에서 이어서 계속 진행됨

switch timeer{
case .success:
    print("3초 안에 task 완료 성공")
case .timedOut:
    print("3초 초과")
}
//print("ddddd")

//해당 그룹의 작업이 끝나고 나면 실행될 내용 클로져로 전달
//queue의 종류를 선택할 수 있음
//group.notify(queue: concurrntQueue){
//    print("asdad")
//}


