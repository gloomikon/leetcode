class Solution {

    private var dp: [Int: [String]] = [
        0: [""],
        1: ["()"],
        2: ["()()", "(())"]
    ]

    func generateParenthesis(_ n: Int) -> [String] {
        if let parentheses = dp[n] {
            return parentheses
        }
        var result: [String] = []

        for i in 0..<n {
            for l in generateParenthesis(i) {
                for r in generateParenthesis(n - 1 - i) {
                    result.append("(" + l + ")" + r)
                }
            }
        }
        dp[n] = result
        return result
    }
}