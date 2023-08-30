class Solution {
    func minimumReplacement(_ nums: [Int]) -> Int {
        let n = nums.count
        var (result, maxMinVal) = (0, nums[n - 1])

        for i in stride(from: n - 2, through: 0, by: -1) {
            let parts = Int(ceil(Double(nums[i]) / Double(maxMinVal)))


            result += parts - 1
            maxMinVal = nums[i] / parts
        }

        return result
    }
}