extension Array {
    subscript(safe bounds: PartialRangeFrom<Int>) -> ArraySlice<Element> {
        guard indices ~= bounds.lowerBound else { return [] }
        return self[bounds.lowerBound..<endIndex]
    }
}

class Solution {
    func canIWin(_ max: Int, _ desiredTotal: Int) -> Bool {
        var dp: [[Int]: Bool] = [:]

        let sum = max * (max + 1) / 2

        guard sum >= desiredTotal else { return false }
        if sum == desiredTotal { return max % 2 == 1 }


        func canWin(choices: [Int], target: Int) -> Bool {
            if choices.last! >= target { return true }
            if let canWin = dp[choices] {
                return canWin
            }
            for i in 0..<choices.count {
                if !canWin(
                    choices: Array(choices[..<i]) + Array(choices[safe: (i + 1)...]),
                    target: target - choices[i]
                ) {
                    dp[choices] = true
                    return true
                }
            }

            dp[choices] = false
            return false
        }

        return canWin(choices: Array(1...max), target: desiredTotal)

    }
}