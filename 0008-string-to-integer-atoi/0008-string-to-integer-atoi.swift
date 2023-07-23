class Solution {
    func myAtoi(_ s: String) -> Int {
        guard !s.contains("+ ") else { return 0 }
        let val = (s as NSString).integerValue
        return val >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), val)
    }
}