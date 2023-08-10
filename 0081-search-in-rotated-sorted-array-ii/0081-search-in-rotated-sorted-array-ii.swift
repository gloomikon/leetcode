class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {

        var (left, right) = (0, nums.count - 1)

        while left < right {
            let middle = (left + right) / 2
            let current = nums[middle]
            if current == target { return true }
            let (l, r) = (nums[left], nums[right])
            if target == l || target == r { return true }
            // [4...7], target == 5
            if (l < current && l...current ~= target) ||
                // [7...4], target = 8 or target == 2
                (l > current && (target > l || target < current))  {
                right = middle - 1
            }
            // [7...10], target == 8
            else if (r > current && current...r ~= target) ||
                        // [10...7], target == 12 or target ==  5
                        (current > r && (target > current || target < r)) {
                left = middle + 1
            } else {
                left += 1
            }
        }

        if nums[left] == target { return true }

        return false
    }
}