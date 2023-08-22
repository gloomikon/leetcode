class Solution {
   func repeatedSubstringPattern(_ s: String) -> Bool {
       let a = Array(s)
       guard a.count > 1 else { return false }
       for i in 1...a.count / 2 {
           guard a.count % i == 0 else { continue }
           let pattern = String(repeating: String(a[0..<i]), count: a.count / i)
           if pattern == s {
               return true
           }
       }
       return false
   }

    // func repeatedSubstringPattern(_ s: String) -> Bool {
    //     String(Array(s + s)[1...].dropLast()).contains(s)
    // }
}