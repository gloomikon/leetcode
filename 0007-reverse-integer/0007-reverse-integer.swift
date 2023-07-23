class Solution {
    func reverse(_ x: Int) -> Int {
        let isNevagtive = x < 0
        var str = String(x)
        if isNevagtive {
            str.remove(at: str.startIndex)
        }

        let result = Int(String(str.reversed())) ?? 0
        if result > Int32.max {
            return 0
        }
        return isNevagtive ? -result : result
    }
}