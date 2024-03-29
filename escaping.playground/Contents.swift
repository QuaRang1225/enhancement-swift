import UIKit


//func printA(completion:@escaping ()->()){
//    DispatchQueue.global().async {
//        print("1")
//        completion()
//        print("2")
//    }
//}
//
//func printB(completion:@escaping ()->()){
//    DispatchQueue.global().async {
//        print("3")
//        completion()
//        print("4")
//    }
//}
//printA {
//    printB {
//        print("5")
//    }
//}
//print("6x")


//func solution(_ v: [[Int]]) -> [Int]
//{
//    var ans = [Int]()
//    
//    var x = [Int]()
//    var y = [Int]()
//    
//    for i in v{
//        x.append(i[0])
//        y.append(i[1])
//    }
//    for i in x{
//        let a = NSCountedSet(array: x).count(for: i)
//        if a == 1{
//            ans.append(i)
//            break
//        }
//    }
//    for i in y{
//        let a = NSCountedSet(array: y).count(for: i)
//        if a == 1{
//            ans.append(i)
//            break
//        }
//    }
//    
//    return ans
//}
//
//print(solution([[1,4],[3,4],[3,10]]))

