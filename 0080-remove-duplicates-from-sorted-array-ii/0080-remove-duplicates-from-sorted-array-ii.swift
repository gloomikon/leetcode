class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        var skippedFirstDuplicate = false
        while i + 1 < nums.count {
            if nums[i] == nums[i + 1] {
                if skippedFirstDuplicate {
                    nums.remove(at: i + 1)
                } else {
                    i += 1
                    skippedFirstDuplicate = true
                }
            } else {
                skippedFirstDuplicate = false
                i += 1
            }
        }

        return nums.count
    }
}