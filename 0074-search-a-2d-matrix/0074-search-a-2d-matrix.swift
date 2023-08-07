class Solution {
    /*
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let array = matrix.flatMap { $0 }
        guard !array.isEmpty else { return false }

        var (left, right) = (0, array.count - 1)
        while left < right {
            let middle = (left + right) / 2
            let b = array[middle]
            if b == target { return true }
            if b > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }

        return array[left] == target
    }
     */

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var (top, bottom) = (0, matrix.count - 1)
        while top < bottom {
            let middle = (top + bottom) / 2
            let row = matrix[middle]
            let (min, max) = (row.first!, row.last!)
            if min...max ~= target { break }
            if target < min {
                bottom = middle - 1
            } else {
                top = middle + 1
            }
        }

        let row = matrix[(top + bottom) / 2]
        var (left, right) = (0, row.count - 1)
        while left < right {
            let middle = (left + right) / 2
            let b = row[middle]
            if b == target { return true }
            if b > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }

        return row[left] == target
    }
}