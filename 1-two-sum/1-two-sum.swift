class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var occurrenceDict: [Int: Int] = [:]

        for index in 0..<nums.count {
            
            let number = nums[index]
            
            // Is there a solution already
            if let secondElementIndex = occurrenceDict[target - number] {
                return [secondElementIndex, index]
            }

            // Add new element
            if occurrenceDict[number] == nil {
                occurrenceDict[number] = index
            }
        }

        return []
    }
}