class Solution {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        var minSpeed = -1
        var left = 1
        var right = Int(1e7)

        while left <= right {
            let targetSpeed = (left + right) / 2
            // Calculate time for this speed

            var totalTime: Double = 0
            dist.enumerated().forEach { index, elem in
                let currentDistanceTime = Double(elem) / Double(targetSpeed)
                totalTime += index == dist.count - 1 ?
                currentDistanceTime :
                ceil(currentDistanceTime)
            }

            if totalTime <= hour {
                minSpeed = targetSpeed
                right = targetSpeed - 1
            } else {
                left = targetSpeed + 1
            }
        }

        return minSpeed
    }
}