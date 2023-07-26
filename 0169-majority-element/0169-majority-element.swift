// https://www.cantorsparadise.com/computing-the-majority-vote-on-pen-and-paper-the-boyer-moore-algorithm-3f739de3d8cb
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0
        var count = 0
        nums.forEach { n in
            if count == 0 { candidate = n }
            count += n == candidate ? 1 : -1
        }
        return candidate
    }
}