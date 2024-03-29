import Foundation
//import SwiftUI

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


//func asyncPrintString(){
//    Task{
//        print("시작")
//        await asyncPlay()   //스레드 제어권 시스템에게 넘어감
//        print("끝")
//    }
//}
//func asyncPlay() async{
//    print("행동")
//}
//asyncPrintString()




//비동기의 경우 작업의 종료를 알수 있는 클로져의 completionHandler가 존재함
//비동기 completion은 @escaping으로 선언되있음
//에러 상황일 경우 completion을 반환하지 않고 그냥 return할 경우 정상적인 동작을 하지 않아 UI를 업데이트하지 못할 수 있음
//물론 ReultType으로 에러도 completion형태로 반환하는게 가능해졌지만, 여전히 에러에 대한 위험은 가지고 있음
//또한 클로져가 중첩이 되면 흔히 말하는 callback지옥이 존재할 수 있음


//그리하여 swift5.5부터 async&await가 도입됨
//비동기 코드를 동기 코드인 것처럼 작성 가능함
//completion handler가 없이도 반환을 보장받을 수 있으며 코드도 짧아짐
//async 코드는 동시 컨텍스트에서만 사용가능함 -> 다른 async메서드나 Task{}
//await 키워드가 붙은 코드는 잠재적으로 일시 중단 지점으로 지정 됨

//suspend - 일시중단
//코드가 suspend되면 작업을 하던 스레드는 제어권을 포기하고 다른 작업을 진행함
//이때 main스레드에서 자동으로 다른 스레드로 작업을 보냄

//func printA() async throws{   //1. 현재 스레드 A사용
//    //2. syncMethod() 실행시키는 순간 스레드 A는 syncMethodA()만을 동작시키는 스레드가 됨
//    syncMethodA()
//    //3. syncMethodA()가 끝나면 스레드 A는 다시 printA()의 컽르롤이 가능하게 됨
//    //4. asyncMethodA()를 실행시키면 또 다시 스레드A는 제어권을 넘겨줌
//    //5. asyncMethodA()도 비동기 함수이기 때문에 스레드A의 제어권은 시스템이 가져가고 시스템은 다른작업을 수행함
//    //6. 시스템이 다른작업을 다루다 어느순간 asyncMethodA()의 우선순위가 다가오면 스레드A의 제어권을 다시 asyncMethodA()를 재개
//    try await asyncMethodA()
//    //7. 스레드 A는 asyncMethodA()를 완료하고 제어권을 printA()를 재개
//    //8. 스레드 A는 printA()를 재개하고 사라짐
//   
//}
//func syncMethodA(){
//    print("sync")
//}
//func asyncMethodA()async throws{
//    print("async")
//}

//Task{
//    try await printA()
//}


//프로그램의 모든 스레드는 함수호출정보를 저장하는 각각 한개의 스택을 가지고 있음
//함수를 실행할때 스택에는 프레임이 push되고 함수가 종료되면 pop됨
//함수내부의 변수 및 내부 함수들도 실행과 종료 선언과 해제 시 push pop이 되는 구조


//func printB() async throws{
//    
//    syncMethodB()
//    try await asyncMethodB()
//   
//}
//func syncMethodB(){
//    print("sync")
//}
//func asyncMethodB()async throws{
//    print("async")
//}
//
//Task{
//    try await printB()
//}

//비동기함수는 await로 suspend가 된 시점에 힙에 기존 메서드에서 하던 작업들을 백업하고 해당 스레드를 다른작업을 실행시킴
//여기서 이전 작업을 기억하고 다시 재개할 수 있도록 기억하는 객체를 countinuation이라 함
//그렇기 때문에 스레드를 새로 생성하지 않아 context swiching을 하지 않음
//countinuation이 다시 재개될때 같은 스레드에서 동작하지 않을 수 있음
//Task블록은 동기 컨텍스트에서 async메서드를 병렬적으로 처리할 수 있도록함
//Task블록 안에서는 순서대로 실행하지만 Task 블록밖에서의 코드와는 동시적으로 실행됨

//func a() async {
//    try? await Task.sleep(nanoseconds: 2000000)
//    print(Thread.current)
//    await MainActor.run{
//        
//    }
//}
//print("1")
//Task{
//    print("2")
//   await a()
//    print("3")
//    await a()
//    print("4")
//    await a()
//}
//print("5")




//print("1: \(Thread.current)")
//let a = DispatchTime.now()
//Task{
////    print("2")
//    print("2: \(Thread.current)")
//    print("2: \(Thread.current)")
//    print("2: \(Thread.current)")
//    print("2: \(Thread.current)")
//}
//DispatchQueue.global().async{
//    print("2.5: \(Thread.current)")
//}
//print("3: \(Thread.current)")

//func a(_ num : Int) async{
//    print("\(num) :\(Thread.current)")
//}
//func printMessage() async {
//        let words = ["Hello", "My", "name", "is", "yujinj"]
//        let string = await withTaskGroup(of: String.self) { taskGroup -> String in
//            for word in words {
//                taskGroup.addTask {
//                    // 시간이 소요되는 작업을 진행
//                    // let data = await requestToServer(word)
//                    // 서버와 통신 후 결과 데이터 반환 (여기서는 그냥 word로 퉁친다.)
//                    return word + " (by Server) "
//                }
//            }
//            
//            var collection = [String]()
//            
//            // taskGroup을 결과값이 들어있는 리스트라고 생각한다.
//            for await value in taskGroup {
//                collection.append(value)
//            }
//     
//            return collection.joined(separator: " ")
//        }
//        
//        print("said:", string)
//    }
//
//Task{
//    await printMessage()
//}

func a() async throws{
    try await Task.sleep(nanoseconds: 200_000_000_0)
}
  
print("0. \(Thread.current)")
Task{
    print("1. \(Thread.current)")
    async let A: () = a()
    print("2. \(Thread.current)")
    async let B:() = a()
    print("3. \(Thread.current)")
    async let C:() = a()
    print("4. \(Thread.current)")
}
print("5. \(Thread.current)")



//var pokemon:[String:Any] = [:]
//
//let a = DispatchTime.now()
//pokemon["num"] = num
//pokemon["dex_region"] = try await pokemonSpeciesManager.getPokdexNumbers(num: num).0
//pokemon["dex_num"] = try await pokemonSpeciesManager.getPokdexNumbers(num: num).1
//pokemon["name"] = try await pokemonSpeciesManager.getName(num: num)
//pokemon["genra"] = try await pokemonSpeciesManager.getGenra(num: num)
//pokemon["egg_group"] = try await pokemonSpeciesManager.getEggGroups(num: num)
//pokemon["gender_rate"] = try await pokemonSpeciesManager.getGenderRate(num: num)
//pokemon["capture_rate"] = try await pokemonSpeciesManager.getCaptureRate(num: num)
//pokemon["hatch_counter"] = try await pokemonSpeciesManager.getHatchCounter(num: num)
//pokemon["text_entries_version"] = try await pokemonSpeciesManager.getTextEntries(num: num).0
//pokemon["text_entries_text"] = try await pokemonSpeciesManager.getTextEntries(num: num).1
//pokemon["forms_switchable"] = try await pokemonSpeciesManager.getFormsSwitchable(num: num)
//pokemon["evolution_tree"] = try await pokemonEvolutionManager.getEvolutionChainUrl(num: num)
//let b = DispatchTime.now()
//
////포켓몬 종 정보
//
//let c = DispatchTime.now()
//await withTaskGroup(of:Void.self) { group in
//    group.addTask {
//        var pokemon:[String:Any] = [:]
//        do{
//            pokemon["num"] = num
//            pokemon["dex_region"] = try await self.pokemonSpeciesManager.getPokdexNumbers(num: num).0
//            pokemon["dex_num"] = try await self.pokemonSpeciesManager.getPokdexNumbers(num: num).1
//            pokemon["name"] = try await self.pokemonSpeciesManager.getName(num: num)
//            pokemon["genra"] = try await self.pokemonSpeciesManager.getGenra(num: num)
//            pokemon["egg_group"] = try await self.pokemonSpeciesManager.getEggGroups(num: num)
//            pokemon["gender_rate"] = try await self.pokemonSpeciesManager.getGenderRate(num: num)
//            pokemon["capture_rate"] = try await self.pokemonSpeciesManager.getCaptureRate(num: num)
//            pokemon["hatch_counter"] = try await self.pokemonSpeciesManager.getHatchCounter(num: num)
//            pokemon["text_entries_version"] = try await self.pokemonSpeciesManager.getTextEntries(num: num).0
//            pokemon["text_entries_text"] = try await self.pokemonSpeciesManager.getTextEntries(num: num).1
//            pokemon["forms_switchable"] = try await self.pokemonSpeciesManager.getFormsSwitchable(num: num)
//            pokemon["evolution_tree"] = try await self.pokemonEvolutionManager.getEvolutionChainUrl(num: num)
//        }
//        catch{
//            print(error)
//        }
//    }
//}
//
//let d = DispatchTime.now()
//
//let e = DispatchTime.now()
//let pokemonSpecies = try await self.getPokemonSpecies(num: num)
//let f = DispatchTime.now()
//print("1. \(b.uptimeNanoseconds-a.uptimeNanoseconds)      2. \(d.uptimeNanoseconds-c.uptimeNanoseconds)       3. \(f.uptimeNanoseconds-e.uptimeNanoseconds)")
