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
class LinkedList<T:Equatable>{
    var head:Node<T>?
    
    //MARK: 리스트 마지막에 노드 추가
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
    
    //MARK: 리스트 중간에 노드 추가
    func insert(_ data:T,index:Int){
        //헤더가 없을 경우 해당 노트가 헤더가 됨
        if head == nil{
            head = Node(data:data)
            return
        }
        //검색을 하기 위해서 헤드부터 검색을 해야하기 때문에 노드에 헤드를 저장
        var node = head
        //특정 인덱스를 찾을때까지 루프를 돌리다 추가하려는 노드의 전까지 루프(해당 인덱스에 추가하려는 것이기 때문에 그 전노드까지 조건을 검)
        for _ in 0..<index-1{
            //만약 해당 노드의 next가 비어있을경우 마지막 노드이기 때문에 루프를 더이상 돌릴수 없음
            if node?.next == nil {break}
            node = node?.next
        }
        //노드의 next를 임시저장
        let newNode = node?.next
        //노드의 next에 새로운 데이터 저장
        node?.next = Node(data: data)
        //노트의 next.net에 기존next값을 저장
        node?.next?.next = newNode
        
    }
    //MARK: 리스트 마지막 노드 삭제
    func removeLast(){
        // 헤더가 nil일경우 삭제할 노드가 없기에 반환
        if head == nil {return}
        //헤더하나 밖에 없을 경우 헤더 삭제
        if head?.next == nil{
            head = nil
            return
        }
        //마지막 노드의 전단계 까지 반복
        var node = head
        while node?.next != nil{
            node = node?.next
        }
        //현재 헤더의 다음 노드 nil로 삭제
        node?.next = nil
    }
    //MARK: 리스트 중간 노드 삭제
    func remove(_ index:Int){
        if head == nil {return}
        if head?.next == nil{
            head = nil
            return
        }
        var node = head
        for _ in 0..<index-1{
            if node?.next?.next == nil {break}
            node = node?.next
        }
        node?.next = node?.next?.next
    }
    //MARK: 리스트 검색
    func search(_ data:T) -> Node<T>?{
        guard head != nil else {return nil}
        
        var node = head
        while node?.next != nil {
            if node?.data == data {break}
            node = node?.next
        }
        return node
    }
}

//var list = LinkedList<Int>()
//list.append(1)
//list.append(2)
//list.append(3)
//list.append(4)
//
//list.remove(2)
//
//var node = list.head
//while node != nil{
//    print(node?.data ?? -1)
//    node = node?.next
//}

//print(list.search(3)?.data)

class BSTNode<T:Comparable>{
    var data: T
    var left: BSTNode?
    var right: BSTNode?
    
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T:Comparable>{
    var root:BSTNode<T>?
    func insert(_ data:T){
        guard let root else {return self.root = BSTNode(data: data)}
        
        var node = root
        while true{
            if data < node.data{
                guard let next = node.left else {
                    return node.left = BSTNode(data: data)
                }
                node = next
            }else{
                guard let next = node.right else {
                    return node.right = BSTNode(data: data)
                }
                node = next
            }
        }
    }
    func diagram(for node: BSTNode<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

let bst = BinarySearchTree<Int>()
bst.insert(30)
bst.insert(20)
bst.insert(43)
bst.insert(12)
bst.insert(1)
bst.insert(61)

print(bst.diagram(for: bst.root))
