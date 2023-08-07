class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let (m, n) = (matrix.count, matrix[0].count)

        var (y, x) = (0, n - 1)
        while y <= m - 1 && x >= 0 {
            let pivot = matrix[y][x]
            if target == pivot { return true }
            if pivot < target {
                y += 1
            } else {
                x -= 1
            }
        }
        return false
    }
}