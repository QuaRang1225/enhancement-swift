import UIKit


print("start")
DispatchQueue.main.async {
    for _ in 0...10 {
        print("async")
    }
}
for _ in 0...10 {
    print("sync")
}
print("end")
