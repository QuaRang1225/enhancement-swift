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


//MARK: 퀵정렬 시간복잡도 O(N logN) - 만약 피벗이 항상 배열중 가장 크거나 작을 경우 O(N^2)
func quickSort(_ array: inout [Int]) -> [Int]{
    guard let first = array.first,array.count > 1 else {return array}
    
    var previous = [Int]()
    var after = [Int]()
    
    array.enumerated().filter { $0.offset != 0 }
        .forEach {
            if $0.element > first {
                after.append($0.element)
            } else if $0.element <= first {
                previous.append($0.element)
            }
        }
    return quickSort(&previous) + [first] + quickSort(&after)
}

//print(quickSort(&array))


//MARK: 피보나치 수열 O(N)
func fibo(_ value:Int) -> Int{
    var temp = [0,1]
    (2...value).forEach {
        temp.append(temp[$0-1] + temp[$0-2])
    }
    return temp[value]
}

//print(fibo(7))

func mergeSort(_ array:[Int]) -> [Int]{
    guard array.count > 1 else {return array}
    
    let center = array.count/2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    func merge(_ left:[Int],_ right: [Int]) -> [Int] {
        
        var leftArr = left
        var rightArr = right
        var result: [Int] = []
        
        while !leftArr.isEmpty,!rightArr.isEmpty{
            if leftArr[0] < rightArr[0]{
                result.append(leftArr.removeFirst())
            }else{
                result.append(rightArr.removeFirst())
            }
        }
        if !leftArr.isEmpty{
            result.append(contentsOf: leftArr)
        }
        if !rightArr.isEmpty{
            result.append(contentsOf: rightArr)
        }
        return result
    }
    return merge(mergeSort(left), mergeSort(right))
}
print(mergeSort(array))
//print(1)
