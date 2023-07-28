class Solution {

    private enum Player {
        case first
        case second
    }

    private func takeNumber(
        from array: [Int],
        firstPlayerSum: Int,
        secondPlayerSum: Int,
        playerToTake player: Player
    ) -> Bool {
        // No elements to take
        if array.isEmpty { return firstPlayerSum >= secondPlayerSum }

        let count = array.count

        // Only one element to take, only one possible take
        if count == 1 {
            switch player {
            case .first:
                return takeNumber(
                    from: [],
                    firstPlayerSum: firstPlayerSum + array[0],
                    secondPlayerSum: secondPlayerSum,
                    playerToTake: .second
                )
            case .second:
                return takeNumber(
                    from: [],
                    firstPlayerSum: firstPlayerSum,
                    secondPlayerSum: secondPlayerSum + array[0],
                    playerToTake: .first
                )
            }
        }

        // Two or more elememts, can take from the beginning or from the end
        switch player {
        case .first:
            return takeNumber(
                from: Array(array[1...]),
                firstPlayerSum: firstPlayerSum + array[0],
                secondPlayerSum: secondPlayerSum,
                playerToTake: .second
            ) || takeNumber(
                from: Array(array[0..<count - 1]),
                firstPlayerSum: firstPlayerSum + array[count - 1],
                secondPlayerSum: secondPlayerSum,
                playerToTake: .second
            )
        case .second:
            return takeNumber(
                from: Array(array[1...]),
                firstPlayerSum: firstPlayerSum,
                secondPlayerSum: secondPlayerSum + array[0],
                playerToTake: .first
            ) && takeNumber(
                from: Array(array[0..<count - 1]),
                firstPlayerSum: firstPlayerSum,
                secondPlayerSum: secondPlayerSum + array[count - 1],
                playerToTake: .first
            )
        }
    }

    func PredictTheWinner(_ nums: [Int]) -> Bool {
        takeNumber(from: nums, firstPlayerSum: 0, secondPlayerSum: 0, playerToTake: .first)
    }
}