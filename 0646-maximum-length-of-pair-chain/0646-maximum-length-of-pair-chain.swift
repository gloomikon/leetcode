class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { lhs, rhs in
            if lhs[1] == rhs[1] {
                return lhs[0] < rhs[0]
            }
            return lhs[1] < rhs[1]
        }

        var lastPair = pairs[0]
        var res = 1
        var i = 1
        while pairs.indices.contains(i) {
            if pairs[i][0] > lastPair[1] {
                lastPair = pairs[i]
                res += 1
            }
            i += 1
        }

        return res
    }
}