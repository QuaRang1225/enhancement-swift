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

//var queue = Queue<Int>()
//print(queue.count)
//print(queue.isEmpty)
//queue.enQueue(3)
//print(queue.queue)
//queue.enQueue(6)
//print(queue.queue)
//print(queue.dequeue())
//print(queue.queue)

//MARK: 노드 생성
class Node<T>{
    var data:T?
    var next:Node?
    init(data: T? = nil, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

//MARK: 링크드 리스트 생성
class LinkedList<T>{
    var head:Node<T>?
    
    func append(_ data:T){
        //헤더가 없을 경우 해당 노트가 헤더가 됨
        if head == nil{
            head = Node(data: data)
            return
        }
        //검색을 하기 위해서 헤드부터 검색을 해야하기 때문에 노드에 헤드를 저장
        var node = head
        //헤더가 기존에 존재할경우 헤더를 검색해서 next가 nil인 노드를 검색하며 노드를 업데이트 하다가 찾으면 루프 탈출
        while node?.next != nil {
            node = node?.next
        }
        //node.next가 nil인게 확인 후 데이터를 추가
        node?.next = Node(data: data)
    }
}

