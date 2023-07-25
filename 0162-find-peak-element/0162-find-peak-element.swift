extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        for i in 0..<nums.count {
            let a = nums[safe: i - 1] ?? .min
            let b = nums[i]
            let c = nums[safe: i + 1] ?? .min
            if a < b, b > c {
                return i
            }
        }
        return 0
    }
}