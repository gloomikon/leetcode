class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n

        reverse(&nums, 0, n)
        reverse(&nums, 0, k)
        reverse(&nums, k, n)
    }

    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        let a = Array(nums[..<start])
        let b = Array(nums[start..<end].reversed())
        let c = Array(nums[end...])
        nums = a + b + c
    }

}