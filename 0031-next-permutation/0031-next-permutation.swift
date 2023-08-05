class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count

        // Find the first index from the end where nums[i] < nums[i + 1]
        var i = n - 2
        while i >= 0 {
            if nums[i] < nums[i + 1] { break }
            i -= 1
        }

        // If index does not exist, the permutation is last ( [3, 2, 1] )
        // so we just reverse the array
        if i == -1 { return nums.reverse() }

        // Find the
        var j = n - 1
        while j > i {
            if nums[j] > nums[i] { break }
            j -= 1
        }

        // swap the smallest element

        let tmp = nums[j]
        nums[j] = nums[i]
        nums[i] = tmp

        nums = nums[...i] + nums[(i + 1)...].reversed()
    }
}