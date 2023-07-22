extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

class Solution {
func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {

        if k == 0 { return 1 }

        var prevDP = Array(
            repeating: Array(repeating: 0.0, count: n),
            count: n
        )
        var currentDP = prevDP

        let directions = [
            (1, 2),
            (1, -2),
            (-1, 2),
            (-1, -2),
            (2, 1),
            (2, -1),
            (-2, 1),
            (-2, -1)
        ]

        prevDP[row][column] = 1

//        if isSafeIndex(row, column, for: n) {
//            prevDP[row][column] = 1
//        }

        for _ in 1...k {
            for i in 0..<n {
                for j in 0..<n {
                    currentDP[i][j] = 0
                    for direction in directions {
                        let prev_i = i - direction.0
                        let prev_j = j - direction.1
                        currentDP[i][j] += (prevDP[safe: prev_i]?[safe: prev_j] ?? 0) / 8
                    }
                }
            }
            prevDP = currentDP
        }

        return currentDP.reduce(0) { prev, array in
            prev + array.reduce(0, +)
        }
    }
}