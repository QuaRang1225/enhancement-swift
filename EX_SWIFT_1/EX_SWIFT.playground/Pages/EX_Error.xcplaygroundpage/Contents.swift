//: [Previous](@previous)

import Foundation

//에러 - 에러를 정의하여 예외처리 가능
//에러처리 - 런타임에러를 방지하기 위해 이를 처리하기 위해 에러를 감지할수 있는 처리
//예를들어, 디스크에서 파일을 읽어 데이터를 처리하는 일을 한다고 할 때 이 작업이 실패할 경우의 수는 여러가지가 존재합니다. 파일이 특정 경로에 존재하지 않거나, 읽기 권한이 없거나 혹은 파일의 데이터가 식별할 수 있는 포맷으로 적절히 인코딩 되지 않은 경우 등 말이죠. 이런 종류별 에러 상황을 식별해 사용자에게 제공해 주면 프로그램 실행중 발생할 각 에러별로 사용자가 적절히 대응할 수 있도록 도울 수 있습니다

enum myInfo:Error{  //에러처리는 열거형이 적합
    case noMyName
    case noMyAge
}
func myNameInfo(_ name:String)throws{   //에러를 던지는 메서드 생성 가능
    print("아이디 찾기 - 이름")
    if name != "콰랑"{
        print("이름이 일치하지 않습니다")
        //return
        throw myInfo.noMyName //특정조건에서 에러를 보내겠다고 반환
    }
    print("이름이 일치합니다")
}

//에러가 생겨도 처리를 하지 않고 싶을 땐 try?를 사용
//try? myNameInfo("콰랑")
//try? myNameInfo("콰렁")

//에러처리를 사용할 때
do{
    try myNameInfo("캐랑")
}catch{
    print("감지된 에러 : \(error)")
}
//절대로 에러가 생기면 안되는 상황이나 에러를 만들고 싶지 않을 때 사용
//try! myNameInfo("콰랑")


/// 나이정보를 확인 할수 있다.
/// - Parameter name: 나이를 입력
/// - Throws: 나이 에러정보 throw
/// - Returns: 일치 여부
func myAgeInfo(_ age:Int) throws -> Bool {
    print("아이디 찾기 - 나이")
    if age != 24{
        print("나이가 일치하지 않습니다")
        throw myInfo.noMyAge
    }
    print("나이가 일치합니다")
    return true
}

//정리 작업 지정 - defer 구문을 블락 종료 직전에 수행할 일을 따로 처리할 수 있음
do{
    let trueState = try myAgeInfo(25)   //false일 때는 값이 아예 저장되지 않음 //바로 throw를 하여 넘어왔기 때문
}catch{
    print("감지된 에러 : \(error)")
    defer{  //아래에서부터 실행
        print("장비를 정지합니다")
        //장비 정지
    }
    defer{
        print("앱을 종료합니다")
        //앱 종료
    }
}
