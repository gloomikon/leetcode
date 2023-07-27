class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        var (l, r) = (batteries.min()!, batteries.reduce(0, +) / n)
        var p = 0

        while l <= r {
            let m = (l + r) / 2
            let maxTime = batteries.reduce(0) { prev, new in prev + min(new, m) }
            if maxTime >= m * n {
                p = m
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return p
    }
}