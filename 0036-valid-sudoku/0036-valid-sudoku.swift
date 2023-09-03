extension Collection where Element: Hashable {
    var areUnique: Bool {
        count == Set(self).count
    }
}

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        func square(_ iRange: Range<Int>, _ jRange: Range<Int>) -> [[Character]] {
            board[iRange.lowerBound..<iRange.upperBound]
                .map {
                    Array($0[jRange.lowerBound..<jRange.upperBound])
                }
        }

        for k in board.indices {
            let row = board[k]
            let column = (0..<9).map { board[$0][k] }

            let i = k % 3
            let j = k / 3
            let (il, ir, jl, jr) = (i * 3, (i + 1) * 3, j * 3, (j + 1) * 3)

            let square = square(il..<ir, jl..<jr)

            guard [row, column, square.flatMap { $0 }].allSatisfy({ block in
                block.filter({ $0.isNumber }).areUnique
            }) else {
                return false
            }
        }

        return true
    }
}