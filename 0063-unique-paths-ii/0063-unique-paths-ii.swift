class Solution {
    func uniquePathsWithObstacles(_ grid: [[Int]]) -> Int {
        let (m, n) = (grid.count, grid[0].count)

        var dp: [Int] = .init(repeating: 0, count: n)
        dp[n - 1] = 1

        for r in stride(from: m - 1, through: 0, by: -1) {
            for c in stride(from: n - 1, through: 0, by: -1) {
                if grid[r][c] == 1 {
                    dp[c] = 0
                } else if c + 1 < n {
                    dp[c] = dp[c] + dp[c + 1]
                }
            }
        }

        return dp[0]
    }
}