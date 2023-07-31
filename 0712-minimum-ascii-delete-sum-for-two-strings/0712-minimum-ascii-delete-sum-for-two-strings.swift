private extension Character {
    var intAsciiValue: Int {
        Int(asciiValue!)
    }
}

class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let (a1, a2, m, n) = (Array(s1), Array(s2), s1.count, s2.count)

        // Make sure s2 is smaller string
        if m < n {
            return minimumDeleteSum(s2, s1)
        }

        // Case for empty s1
        var currentRow: [Int] = .init(repeating: 0, count: n + 1)
        for j in 1...n {
            currentRow[j] = currentRow[j - 1] + a2[j - 1].intAsciiValue
        }

        // Compute answer row-by-row
        for i in 1...m {
            var diag = currentRow[0]
            currentRow[0] += a1[i - 1].intAsciiValue

            var answer: Int!

            for j in 1...n {
                // If characters are the same, the answer is top-left-diagonal value
                if a1[i - 1] == a2[j - 1] {
                    answer = diag
                }
                // Otherwise, the answer is minimum of top and left values with
                // deleted character's ASCII value
                else {
                    answer = min(
                        a1[i - 1].intAsciiValue + currentRow[j],
                        a2[j - 1].intAsciiValue + currentRow[j - 1]
                    )
                }

                // Before overwriting currentRow[j] with the answer, save it in diag
                // for the next column
                diag = currentRow[j]
                currentRow[j] = answer
            }
        }

        return currentRow.last!
    }
}