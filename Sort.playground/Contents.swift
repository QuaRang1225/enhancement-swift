import UIKit


var swapCount = 0
var array = [1,6,2,7,4,3,5,10,8,9]
var sortedArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


//MARK: 버블정렬 알고리즘 시간복잡도 : O(N^2)
func bubbleSort(_ array:inout [Int]){
    
    let n = array.count
    var isSwap = false
    guard n > 1 else {return}
    for i in 0..<n{
        for j in 0..<(n-1 - i){
            if array[j] > array[j + 1]{
                array.swapAt(j, j+1)
                isSwap = true
                swapCount += 1
            }
        }
        guard !isSwap else {return}
    }
}
bubbleSort(&sortedArray)
print(sortedArray)
print(swapCount)



