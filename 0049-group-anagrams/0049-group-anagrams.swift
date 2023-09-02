extension Collection where Element: Hashable {
    var occurrences: [Element: Int] {
        reduce(into: [:]) { counts, element in
            counts[element, default: 0] += 1
        }
    }
}

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [Int: [String]] = [:]
        for str in strs {
            var arr = groups[str.occurrences.hashValue, default: []]
            arr.append(str)
            groups[str.occurrences.hashValue] = arr
        }

        return groups.map { _, value in value }
    }
}