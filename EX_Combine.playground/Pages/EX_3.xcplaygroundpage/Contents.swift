//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Error>()
var cancelable = Set<AnyCancellable>()

let subscriber = subject.sink(receiveCompletion: { _ in
    print("데이터의 발행이 끝났습니다.")
}, receiveValue: { value in
  print(value)
})


//데이터를 외부에서 발행가능
subject.send("A")
//subject.send(completion: .finished) //종료
subject.send("B")
subscriber.store(in:&cancelable)






/*
 A
 데이터의 발행이 끝났습니다.
 */


let subject1 = CurrentValueSubject<Int, Never>(0)


subject1
    .sink(receiveValue: { print($0) })  //초기값을 출력하고 이벤트 처리
    .store(in: &cancelable)

subject1.send(1)
subject1.value = 2

/*
 0
 1
 2
 */
