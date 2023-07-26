class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0
        var count = 0
        nums.forEach { n in
            if count == 0 { candidate = n }
            count += n == candidate ? 1 : -1
        }
        return candidate
    }
}