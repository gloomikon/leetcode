class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        
        let n = nums.count

        // Modulo ensures the range within the length and avoids unnecessary rotation.
        let k = k % n

        reverse(&nums, 0, n-1)
        reverse(&nums, 0, k-1)
        reverse(&nums, k, n-1)
    }

    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {

        var start = start
        var end = end

        while start < end{

            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp

            start += 1
            end -= 1
        }
    }
}