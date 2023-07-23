class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.endIndex - 1

        var maxArea = 0

        while left < right {
            let area = min(height[left], height[right]) * (right - left)
            maxArea = max(maxArea, area)

            if height[left] > height[right] {
                right -= 1
            } else {
                left += 1
            }
        }

        return maxArea
    }
}
