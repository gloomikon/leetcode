precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator ** : ExponentiationPrecedence

func **(num: Int, power: Int) -> Int {
    Int(pow(Double(num), Double(power)))
}

class Solution {
    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        let MOD = 10**9 + 7

        var dp: [[Int]] = .init(
            repeating: .init(
                repeating: 0,
                count: n + 1
            ),
            count: goal + 1
        )

        dp[0][0] = 1

        for i in 1...goal {
            for j in 1...min(i, n) {
                // The i-th song is a new song
                dp[i][j] = dp[i - 1][j - 1] * (n - j + 1) % MOD
                // The i-th song is a song we have played before
                if j > k {
                    dp[i][j] = (dp[i][j] + dp[i - 1][j] * (j - k)) % MOD
                }
            }
        }

        return dp[goal][n]
    }
}
