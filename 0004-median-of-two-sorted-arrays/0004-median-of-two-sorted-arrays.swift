class Solution {
    func findMedianSortedArrays(_ a: [Int], _ b: [Int]) -> Double {
        let (lenA, lenB) = (a.count, b.count)
        let n = lenA + lenB

        func solve(_ k: Int, _ aStart: Int, _ aEnd: Int, _ bStart: Int, _ bEnd: Int) -> Int {
            // If the segment of on array is empty, it means we have passed all
            // its element, just return the corresponding element in the other array.
            if aStart > aEnd {
                return b[k - aStart]
            }
            if bStart > bEnd {
                return a[k - bStart]
            }

            // Get the middle indexes and middle values of A and B.
            let (aIndex, bIndex) = ((aStart + aEnd) / 2, (bStart + bEnd) / 2)
            let (aValue, bValue) = (a[aIndex], b[bIndex])

            // If k is in the right half of A + B, remove the larger right half.
            if aIndex + bIndex < k {
                return aValue > bValue ?
                solve(k, aStart, aEnd, bIndex + 1, bEnd) :
                solve(k, aIndex + 1, aEnd, bStart, bEnd)
            }
            // Otherwise, remove the smaller left half.
            else {
                return aValue > bValue ?
                solve(k, aStart, aIndex - 1, bStart, bEnd) :
                solve(k, aStart, aEnd, bStart, bIndex - 1)
            }
        }

        return n % 2 == 1 ?
        Double(solve(n / 2, 0, lenA - 1, 0, lenB - 1)) :
        (Double(solve(n / 2 - 1, 0, lenA - 1, 0, lenB - 1)) + Double(solve(n / 2, 0, lenA - 1, 0, lenB - 1))) / 2
    }
}