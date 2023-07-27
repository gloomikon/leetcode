class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let (a, n) = (nums.sorted(), nums.count)
        var (minDiff, sum) = (Int.max, 0)

        for i in 0..<n - 2 {
            var (l, r) = (i + 1, n - 1)
            while l < r {
                let s = a[i] + a[l] + a[r]
                if s == target { return s }
                let diff = abs(target - s)
                if diff < minDiff {
                    minDiff = diff
                    sum = s
                }
                if s < target {
                    l += 1
                } else {
                    r -= 1
                }
//                if diff > 0 {
//                    l += 1
//                } else {
//                    r -= 1
//                }
            }
        }

        return sum
    }
}
