class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let (s1, s2, s3) = (Array(s1), Array(s2), Array(s3))
        let (c1, c2, c3) = (s1.count, s2.count, s3.count)
        guard c1 + c2 == c3 else { return false }

        var dp: [[Bool]] = .init(
            repeating: .init(
                repeating: false,
                count: c2 + 1),
            count: c1 + 1
        )

        dp[c1][c2] = true

        for i in stride(from: c1, through: 0, by: -1) {
            for j in stride(from: c2, through: 0, by: -1) {
                if i < c1, s1[i] == s3[i + j], dp[i + 1][j] {
                    dp[i][j] = true
                }
                if j < c2, s2[j] == s3[i + j], dp[i][j + 1] {
                    dp[i][j] = true
                }
            }
        }

        return dp[0][0]
    }
}