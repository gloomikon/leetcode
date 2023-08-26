class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { lhs, rhs in
            (lhs[1], lhs[0]) < (rhs[1], rhs[0])
        }

        var (lastPair, result, i) = (pairs[0], 1, 1)

        while pairs.indices.contains(i) {
            defer { i += 1 }
            if pairs[i][0] > lastPair[1] {
                lastPair = pairs[i]
                result += 1
            }
        }

        return result
    }
}