class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }

        var len = 0
        var chars = [Character]()

        for char in s {

            if let idx = chars.firstIndex(of: char) {
                chars.removeSubrange(0...idx)
            }

            chars.append(char)
            len = max(len, chars.count)
        }

        return len
    }
}