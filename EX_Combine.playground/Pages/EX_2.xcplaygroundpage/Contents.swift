import Foundation
import Combine

class NumberSubscrbier: Subscriber{

    func receive(completion: Subscribers.Completion<Never>) {
        print("구독 종료")
    }

    func receive(subscription: Subscription) {
        print("구독 시작")
        //subscription.request(.unlimited)    //구독할 데이터의 개수 제한하지않음
        subscription.request(.max(4))   //구독할 데이터의 개수 최대 5개
    }

    func receive(_ input: Input) -> Subscribers.Demand {  //output과 같은 타입
        print("데이터 : ", input)
        return .none
        //return .unlimited
    }
    
    typealias Input = Int //성공타입
    typealias Failure = Never //실패타입
    
}

let publisher = [1,2,3,4,5].publisher

let subscriber = NumberSubscrbier()

publisher.subscribe(subscriber)
