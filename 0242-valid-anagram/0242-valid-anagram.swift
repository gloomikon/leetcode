extension Collection where Element: Hashable {
    var occurrences: [Element: Int] {
        reduce(into: [:]) { counts, element in
            counts[element, default: 0] += 1
        }
    }
}

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        s.occurrences == t.occurrences
    }
}