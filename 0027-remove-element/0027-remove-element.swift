class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll { $0 == val }

        return nums.count
    }
}