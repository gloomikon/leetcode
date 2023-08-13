class Solution {
    func validPartition(_ nums: [Int]) -> Bool {
        let n = nums.count
        let two = nums[n - 1] == nums[n - 2]

        if n == 2 {
            return two
        }
        let three = Set([nums[n - 1], nums[n - 2], nums[n - 3]]).count == 1 ||
        Set([nums[n - 3] + 1, nums[n - 2], nums[n - 1] - 1]).count == 1

        var dp = [three, two, false]

        for i in stride(from: n - 4, through: 0, by: -1) {
            var curr = (nums[i] == nums[i + 1]) && dp[1]
            curr = curr || (
                (Set([nums[i], nums[i + 1], nums[i + 2]]).count == 1 ||
                Set([nums[i] + 1, nums[i + 1], nums[i + 2] - 1]).count == 1) &&
                dp[2]
            )
            dp = [curr, dp[0], dp[1]]
        }
        return dp[0]
    }
}
