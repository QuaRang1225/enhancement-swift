import UIKit
import Foundation
import Combine

var myArr:Publishers.Sequence<[Int],Never> = [1,2,3].publisher       //publisher 설정
//Never일 때는 에러가 나지 않음
//Publisher는 <리턴타입,에러타입>프로토콜 준수
//myArr.sink(receiveCompletion: { completion in
//    switch completion{
//    case .finished:
//        print("완료")
//    case .failure(let error):
//        print("실패 : \(error)")
//    }
//},receiveValue:{ receive in
//    print("값을 받음 : \(receive)")
//})
var myNotification = Notification.Name("com.Quarng")
var publisher = NotificationCenter.default.publisher(for: myNotification)
//notification 이름으로 Publisher를 만듬
var mysubscription:AnyCancellable?
var mySubscriptionSet = Set<AnyCancellable>()  //하나씩 관리하지 않고 포괄적으로 관리하게 되는 경우

mysubscription = publisher.sink(receiveCompletion: { completion in
    switch completion{
    case .finished:
        print("완료")
    case .failure(let error):
        print("실페 : \(error)")
    }
}, receiveValue: { receive in
    print("완료 : \(receive)")
})

NotificationCenter.default.post(Notification(name: myNotification)) //Notification을 호출하는것임으로 내용이 전부 나옴
NotificationCenter.default.post(Notification(name: myNotification))
NotificationCenter.default.post(Notification(name: myNotification))
//이벨트 호출
mysubscription?.store(in: &mySubscriptionSet)//매개변수 자체를 변경하기 위함 - inout
mysubscription?.cancel()    //취소를 하지 않으면 메모리에 계속 남아 있음으로 취소처리를 해야함

//KVO - Key Value Observing : 키와 값을 관찰자

class MyFriend {
    var name = "천영"{
        didSet{
            print("이름이 설정 됨 \(name)")
        }
    }
}
var myFriend = MyFriend()
var nameSet:AnyCancellable = ["승우"].publisher.assign(to: \.name, on: myFriend)   //assign을 통해서 구독 가능
