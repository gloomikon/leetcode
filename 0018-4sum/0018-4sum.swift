class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let (a, n) = (nums.sorted(), nums.count)
        guard n >= 4 else { return [] }
        var answer: Set<[Int]> = []

        for i in 0..<n - 3 {
            for j in i + 1..<n - 2 {
                var (l, r) = (j + 1, n - 1)
                while l < r {
                    let s = a[i] + a[j] + a[l] + a[r]
                    if s == target {
                        answer.insert([a[i], a[j], a[l], a[r]])
                    }
                    if s > target {
                        r -= 1
                    } else {
                        l += 1
                    }
                }
            }
        }
        return Array(answer)
    }
}