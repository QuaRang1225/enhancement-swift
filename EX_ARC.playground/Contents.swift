import UIKit


class Human{
    var name = ""
    lazy var getName: () -> String? = { [weak self] in
        
        return self?.name
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Human Deinit!")
    }
}

var sodeul: Human? = .init(name: "Kim-Sodeul")
print(sodeul?.getName)
