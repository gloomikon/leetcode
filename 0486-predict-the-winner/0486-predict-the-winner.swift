class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        var (dp, n) = (nums, nums.count)

        for diff in 1..<n {
            for left in 0..<n - diff {
                let right = left + diff
                dp[left] = max(nums[left] - dp[left + 1], nums[right] - dp[left])
            }
        }

        return dp[0] >= 0
    }
}