class Solution {
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
}