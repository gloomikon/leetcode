extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        for i in 0..<arr.count {
            if let a = arr[safe: i - 1], let c = arr[safe: i + 1] {
                if a < arr[i], arr[i] > c {
                    return i
                }
            }
        }
        return 0
    }
}
