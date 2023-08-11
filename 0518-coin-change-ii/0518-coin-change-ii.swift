extension Array {
    subscript(safe index: Int, default: Element) -> Element {
        indices ~= index ? self[index] : `default`
    }
}

class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 { return 1 }
        let n = coins.count

        var dp: [Int] = .init(repeating: 0, count: amount + 1)
        dp[0] = 1

        for i in stride(from: n - 1, through: 0, by: -1) {
            var nextDP: [Int] = .init(repeating: 0, count: amount + 1)
            nextDP[0] = 1

            for a in 1...amount {
                nextDP[a] = dp[a] + nextDP[safe: a - coins[i], 0]
            }
            dp = nextDP
        }

        return dp[amount]
    }
}