extension Array {
    subscript(safe index: Int, default: Element) -> Element {
        indices ~= index ? self[index] : `default`
    }
}

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text2.count < text1.count {
            return longestCommonSubsequence(text2, text1)
        }

        let (n, m, a, b) = (text1.count, text2.count, Array(text1), Array(text2))

        var (prev, curr) = ([Int].init(repeating: 0, count: n), [Int].init(repeating: 0, count: n))

        for i in 0..<m {
            for j in 0..<n {
                curr[j] = a[j] == b[i] ?
                prev[safe: j - 1, 0] + 1 :
                max(curr[safe: j - 1, 0], prev[j])
            }
            prev = curr
        }

        return curr.last!
    }
}