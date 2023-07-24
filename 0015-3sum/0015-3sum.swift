class Solution {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var answer: Set<[Int]> = []

        let size = nums.count

        var map: [Int: [Int]] = nums.enumerated().reduce([:]) { dict, tuple in
            let index = tuple.offset
            let element = tuple.element
            var dict = dict
            if let array = dict[element] {
                dict[element] = array + [index]
            } else {
                dict[element] = [index]
            }
            return dict
        }

        for i in 0..<size {
            for j in i + 1..<size {
                let a = nums[i]
                let b = nums[j]
                let sum = nums[i] + nums[j]
                let c = -sum
                if let array = map[c],
                   array.contains(where: { $0 != i && $0 != j }) {
                    let newMember = [a, b, c].sorted()
                    answer.insert(newMember)
                }
            }
        }

        return Array(answer)
    }
}