class Solution {
    func partitionString(_ s: String) -> Int {
        var count = 1
        var used: Set<Character> = []
        let a = Array(s)
        for i in 0..<a.count {
            if used.contains(a[i]) {
                count += 1
                used = []
            }
            used.insert(a[i])
        }

        return count
    }
}