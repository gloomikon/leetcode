class Solution {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        let intervals = ranges
            .enumerated().map { (max(0, $0.offset - $0.element), $0.offset + $0.element) }
            .filter { $0.0 != $0.1 }
            .sorted { a, b in
                if a.0 == b.0 {
                    return a.1 > b.1
                } else {
                    return a.0 < b.0
                }
            }

        guard intervals.count > 0 else { return -1 }
        guard intervals[0].0 <= 0 else { return -1 }

        var needToCover = (intervals[0].1, n)
        var result = 1, i = 1

        while i < intervals.count {
            guard needToCover.0 < needToCover.1 else { return result }
            var j = i, maxRightIdx = -1
            while j < intervals.count, intervals[j].0 <= needToCover.0 {
                guard maxRightIdx != -1 else { maxRightIdx = j; j += 1; continue }
                if intervals[maxRightIdx].1 < intervals[j].1 {
                    maxRightIdx = j
                }
                j += 1
            }

            guard maxRightIdx != -1 else { return -1 }
            needToCover.0 = intervals[maxRightIdx].1
            i = maxRightIdx + 1
            result += 1
        }

        return needToCover.0 < needToCover.1 ? -1 : result
    }
}