class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count == 1 { return [nums] }

        var nums = nums
        var answer: [[Int]] = []

        for _ in 0..<count {
            let n = nums.removeLast()
            let perms = permute(nums).map { $0 + [n] }
            answer += perms
            nums = [n] + nums
        }

        return answer
    }
}