class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var dict: [Int: Set<Int>] = [:]

        for road in roads {
            let (a, b) = (road.first!, road.last!)
            var (setA, setB) = (dict[a, default: []], dict[b, default: []])
            setA.insert(b)
            setB.insert(a)
            dict[a] = setA
            dict[b] = setB
        }

        var maxRank = 0

        for a in 0..<n {
            for b in a + 1..<n {
                let hasConnection = dict[a, default: []].contains(b)
                let rank = dict[a, default: []].count + dict[b, default: []].count - (hasConnection ? 1 : 0)
                maxRank = max(maxRank, rank)
            }
        }

        return maxRank
    }
}
