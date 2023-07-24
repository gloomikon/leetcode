class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var answer: Set<[Int]> = []
        let size = nums.count
        let sortedNums = nums.sorted()

        for i in 0..<size {
//            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
//                continue // Skip duplicate elements to avoid duplicate triplets
//            }

            var left = i + 1
            var right = size - 1

            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]

                if sum == 0 {
                    answer.insert([sortedNums[i], sortedNums[left], sortedNums[right]])

                    // Skip duplicate elements to avoid duplicate triplets
                    repeat { left += 1 } while left < right && sortedNums[left] == sortedNums[left - 1]
                    repeat { right -= 1 } while left < right && sortedNums[right] == sortedNums[right + 1]
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return Array(answer)
    }
}