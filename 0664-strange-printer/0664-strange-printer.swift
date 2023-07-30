class Solution {
    func strangePrinter(_ s: String) -> Int {
        let (a, n) = (Array(s), s.count)
        var dp: [[Int?]] = .init(repeating: .init(repeating: nil, count: n), count: n)

        func solve(_ l: Int, _ r: Int) -> Int {
            if let value = dp[l][r] {
                return value
            }

            dp[l][r] = n
            var j: Int?
            for i in l..<r {
                if a[i] != a[r] && j == nil {
                    j = i
                }
                if let j = j {
                    dp[l][r] = min(dp[l][r]!, 1 + solve(j, i) + solve(i + 1, r))
                }
            }
            if j == nil {
                dp[l][r] = 0
            }

            return dp[l][r]!
        }

        return solve(0, n - 1) + 1
    }
}