import UIKit
import Foundation


//func circularArray(n: Int, endNode: [Int]) -> Int {
//    var currIndex = 0
//        for i in 0..<endNode.count {
//            let distance = endNode[i] - currIndex
//            if distance < 0 {
//                currIndex = (currIndex + distance + n) % n
//            } else {
//                currIndex = (currIndex + distance) % n
//            }
//        }
//        return currIndex
//    }
//
//
//
//
//
//let n = 10
//let endNode = [1, 5, 10, 5]
//print(circularArray(n: n, endNode: endNode)) // Output: 5
//
//let n2 = 10
//let endNode2 = [8, 2, 7, 9, 10]
//print(circularArray(n: n2, endNode: endNode2)) // Output: 9
//
//
//let arr = [1,2,3,4,5,6]
//
//print(String(format: "%.6f", Double(3)/Double(arr.count)))

func plusMinus(arr: [Int]) -> Void {
    let negative = arr.filter { $0 < 0 }
    let positive = arr.filter{$0 > 0}
    let zero = arr.filter{$0 == 0}
    print(String(format: "%.6f", Double(positive.count)/Double(arr.count)))
    print(String(format: "%.6f", Double(negative.count)/Double(arr.count)))
    print(String(format: "%.6f", Double(zero.count)/Double(arr.count)))
}
plusMinus(arr: [-1,-1,0,1,1])


func miniMaxSum(arr: [Int]) -> Void {
    var sortArr = arr
        sortArr.sort()

        var first = 0
        var second = 0

        for i in 0..<arr.count-1{
             first += sortArr[i]
        }
        for i in 1..<arr.count{
             second += sortArr[i]
        }
        print(first, second)


}
miniMaxSum(arr: [7,69,2,221,8974])


func timeConversion(s: String) -> String {

    let dateFormatterInput = DateFormatter()
    dateFormatterInput.dateFormat = "hh:mm:ssa"

    let dateFormatterOutput = DateFormatter()
    dateFormatterOutput.dateFormat = "HH:mm:ss"

    if let date = dateFormatterInput.date(from: s) {
        let outputString = dateFormatterOutput.string(from: date)
        return outputString
    } else {
        return ""
    }

}
print(timeConversion(s: "07:05:45PM"))


func findMedian(arr: [Int]) -> Int {
    let sortedArr = arr.sorted()
    let midIndex = arr.count / 2
    
    if arr.count % 2 == 0 {
        // 배열의 길이가 짝수인 경우, 중앙값은 두 값의 평균이다.
        return (sortedArr[midIndex] + sortedArr[midIndex - 1]) / 2
    } else {
        // 배열의 길이가 홀수인 경우, 중앙값은 하나의 값이다.
        return sortedArr[midIndex]
    }

}
print(findMedian(arr: [1,7,3,4,8,1,0]))



