import UIKit

//MARK: 스택구조
struct Stack<T>{
    var stack:[T] = []
    
    var count:Int{
        return stack.count
    }
    
    var isEmpty:Bool{
        return stack.isEmpty
    }
    mutating func push(_ value:T){
        stack.append(value)
    }
    mutating func pop() -> T? {
        return stack.isEmpty ? nil : stack.popLast()
    }
}

var stack = Stack<Int>()
print(stack.count)
print(stack.isEmpty)
print(stack.push(3))
print(stack.stack)
print(stack.push(6))
print(stack.stack)
print(stack.pop() ?? "배열 비어있음")

