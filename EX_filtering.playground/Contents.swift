import UIKit


let arr = [1, 3, 2, 7, 3, 1]
print(arr)           // [1, 3, 2, 7, 3, 1]
print(arr.uniqued()) // [1, 3, 2, 7]

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
