class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        let n = s.count
        var dp: [Bool] = .init(repeating: false, count: n + 1)
        dp[n] = true

        for i in stride(from: n - 1, through: 0, by: -1) {
            for word in wordDict {
                let l = word.count
                if i + l <= n && String(s[i..<i + l]) == word {
                    dp[i] = dp[i + l]
                }
                if dp[i] {
                    break
                }
            }
        }

        return dp[0]
    }
}