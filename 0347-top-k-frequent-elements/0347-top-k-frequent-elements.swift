extension Collection where Element: Hashable {
    var occurrences: [Element: Int] {
        reduce(into: [:]) { counts, element in
            counts[element, default: 0] += 1
        }
    }
}

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        Array(
            nums.occurrences
                .sorted { lhs, rhs in
                    lhs.value > rhs.value
                }
                .map { $0.key }
                .prefix(k)
        )
    }
}