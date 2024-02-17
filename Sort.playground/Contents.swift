import UIKit


var swapCount = 0
var array = [1,6,2,7,4,3,5,10,8,9]
var sortedArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


//MARK: 버블정렬 알고리즘 시간복잡도 : O(N^2)
func bubbleSort(_ array:inout [Int]){
    
//    let n = array.count
//    var isSwap = false
//    guard n > 1 else {return}
//    for i in 0..<(n-1){
//        for j in 0..<(n-1 - i){
//            if array[j] > array[j + 1]{
//                array.swapAt(j, j+1)
//                isSwap = true
//                swapCount += 1
//            }
//        }
//        guard !isSwap else {return}
//    }
    let n = array.count
    var isSwap = false
    guard n > 1 else{ return }
    for i in 0..<n-1{
        for j in 0..<(n-1)-i{
            if array[j] > array[j+1]{
                array.swapAt(j, j+1)
                isSwap = true
            }
        }
        guard !isSwap else {return}
    }
}
//bubbleSort(&sortedArray)
//print(sortedArray)
//print(swapCount)




//MARK: 선택정렬 알고리즘 시간복잡도 : O(N^2)
func selectSort(_ array:inout [Int]){
    
//    let n = array.count
//    guard n > 1 else {return}
//    for i in 0..<(n-1){
//        var min = i
//        for j in (i+1)..<n{
//            if array[min] > array[j]{
//                min = j
//            }
//            swapCount += 1
//        }
//        array.swapAt(min, i)
//    }
    let n = array.count
    guard n > 1 else {return}
    for i in 0..<n-1{
        var stand = i
        for j in (i+1)..<n{
            if array[stand] > array[j]{
                stand = j
            }
        }
        array.swapAt(i, stand)
    }
}

//selectSort(&array)
//print(array)
//print(swapCount)


//MARK: 삽입 정렬 알고리즘 시간복잡도 : O(N^2)
func insertSrot(_ array:inout [Int]){
//    let n = array.count
//    guard n > 1 else {return}
//    for i in 1..<n{
//        for j in stride(from: i, to: 0, by: -1){
//            if array[j] < array[j-1]{
//                array.swapAt(j, j-1)
//                swapCount += 1
//            }else{
//                break
//            }
//        }
//    }
    let n = array.count
    guard n > 1 else {return}
    for i in 1..<n{
        for j in stride(from: i, to: 0, by: -1){
            if array[j] < array[j-1]{
                array.swapAt(j, j-1)
            }
        }
    }
}

//insertSrot(&array)
//print(array)
//print(swapCount)

//MARK: 재귀함수 시간복잡도 O(N)
func factorial(_ value:Int) -> Int{
    guard value > 2 else { return value}
    return (value * factorial(value - 1))
}

//print(factorial(3))


//MARK: 퀵정렬 시간복잡도 O(N) - 만약 피벗이 항상 배열중 가장 크거나 작을 경우 O(N^2)
func quickSort(_ array: inout [Int]) -> [Int]{
    guard let first = array.first,array.count > 1 else {return array}
    
    var previous = array.filter{$0 < first}
    var after = array.filter{$0 > first}
    return quickSort(&previous) + [first] + quickSort(&after)
}

print(quickSort(&array))
