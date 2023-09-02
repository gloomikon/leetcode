class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var cache: [Int: Bool] = [:]

        for num in nums {
            if cache[num, default: false] {
                return true
            }
            cache[num] = true
        }

        return false
    }
}