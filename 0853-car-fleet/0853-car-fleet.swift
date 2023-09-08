class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let info = zip(position, speed)
            .map { (position: $0.0, speed: $0.1) }
            .sorted { lhs, rhs in
                lhs.position > rhs.position
            }

        var stack: [(position: Int, speed: Int)] = []
        for (position, speed) in info {
            if stack.isEmpty || !intersect(target: target, (position: position, speed: speed), stack.last!) {
                stack.append((position: position, speed: speed))
            }
        }

        return stack.count
    }

    private func intersect(
        target: Int,
        _ lhs: (position: Int, speed: Int),
        _ rhs: (position: Int, speed: Int)
    ) -> Bool {
        let lhsTime = Double(target - lhs.position) / Double(lhs.speed)
        let rhsTime = Double(target - rhs.position) / Double(rhs.speed)
        return lhsTime <= rhsTime
    }
}