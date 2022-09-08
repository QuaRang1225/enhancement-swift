//: [Previous](@previous)

import Foundation

struct Grade{
    var num:Int = 1
    
    var trans:Grade{
        get{
            return Grade(num:num+7)
        }
        set(val){
            num =  7+val.num
        }
    }
    
}
var gradeone:Grade = Grade()    //저장프로퍼티에 접근만 하고 직접 사용하지 않을 시에는 getter 실행
print("초등학교 \(gradeone.num)학년은 \(gradeone.trans.num)살입니다.")

var grade:Grade = Grade(num:3)  //저장프로퍼티에 직접 값을 설정을 할 시 setter 실행
print("초등학교 \(grade.num)학년은 \(grade.trans.num)살입니다.")

