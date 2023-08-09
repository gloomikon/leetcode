class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        if p == 0 { return 0 }
        
        let nums = nums.sorted()

        func isValid(_ threshold: Int) -> Bool {
            var (i, count) = (0, 0)
            while i < nums.count - 1 {
                if abs(nums[i] - nums[i + 1]) <= threshold {
                    count += 1
                    i += 2
                } else {
                    i += 1
                }
                if count == p {
                    return true
                }
            }
            return false
        }

        var (l, r, res) = (0, Int(pow(10.0, 9.0)), Int(pow(10.0, 9.0)))

        while l <= r {
            let m = l + (r - l) / 2 // (l + r) / 2
            if isValid(m) {
                res = m
                r = m - 1
            } else {
                l = m + 1
            }
        }

        return res
    }
}