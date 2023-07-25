class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let length = nums.count
        var i = 0
        while i + 1 < length, nums[i] < nums[i + 1] {
            i += 1
        }
        return i
    }
}