class Solution {
    func strangePrinter(_ s: String) -> Int {
        let (a, n) = (Array(s), s.count)
        var dp: [[Int]] = .init(repeating: .init(repeating: n, count: n), count: n)

        for length in 1...n {
            for l in 0...n - length {
                let r = l + length - 1
                var j = -1
                for i in l..<r {
                    if a[i] != a[r] && j == -1 {
                        j = i
                    }
                    if j != -1 {
                        dp[l][r] = min(dp[l][r], 1 + dp[j][i] + dp[i + 1][r])
                    }
                }
                if j == -1 {
                    dp[l][r] = 0
                }
            }
        }

        return dp[0][n - 1] + 1
    }
}