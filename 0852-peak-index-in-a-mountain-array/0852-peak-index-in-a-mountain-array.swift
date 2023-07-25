class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var i = 0
        while arr[i] < arr[i + 1] {
            i += 1
        }
        return i
    }
}
