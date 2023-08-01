class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []

        func backtrack(_ start: Int, _ comb: [Int]) {
            if comb.count == k {
                res.append(comb)
                return
            }
            guard start <= n else { return }
            var comb = comb
            for i in start...n {
                comb.append(i)
                backtrack(i + 1, comb)
                _ = comb.removeLast()
            }
        }

        backtrack(1, [])

        return res
    }
}