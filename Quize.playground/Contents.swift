import UIKit

//MARK: K번째 수
func solution(_ array:[Int],_ commands:[[Int]]) -> [Int]{
    
    var arrays:[Int] = []
    for command in commands{
        
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        
        var sortedArr = array[i...j].sorted()
        arrays.append(sortedArr[k])
        
    }
    return arrays
}
print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
