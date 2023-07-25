class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var merged: [Int] = []
        merged.reserveCapacity(n + m)

        var i = 0
        var j = 0
        while i < m && j < n {
            if nums1[i] < nums2[j] {
                merged.append(nums1[i])
                i += 1
            } else {
                merged.append(nums2[j])
                j += 1
            }
        }
        while i < m {
            merged.append(nums1[i])
            i += 1
        }
        while j < n {
            merged.append(nums2[j])
            j += 1
        }
        nums1 = merged
    }
}