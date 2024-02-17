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

//var stack = Stack<Int>()
//print(stack.count)
//print(stack.isEmpty)
//print(stack.push(3))
//print(stack.stack)
//print(stack.push(6))
//print(stack.stack)
//print(stack.pop() ?? "배열 비어있음")

//MARK: 큐 구조
struct Queue<T>{
    var queue:[T?] = []
    var header = 0
    let headMaximum = 50
    var count:Int{
        return queue.count
    }
    var isEmpty:Bool{
        return queue.isEmpty
    }
    
    mutating func enQueue(_ value:T){
        queue.append(value)
    }
    mutating func dequeue() -> T?{
        queue[header] = nil
        header += 1
        
        if header > headMaximum{
            queue = queue.filter{$0 != nil}
            header = 0
        }
        return queue[header]
    }
}

var queue = Queue<Int>()
print(queue.count)
print(queue.isEmpty)
queue.enQueue(3)
print(queue.queue)
queue.enQueue(6)
print(queue.queue)
print(queue.dequeue())
print(queue.queue)
