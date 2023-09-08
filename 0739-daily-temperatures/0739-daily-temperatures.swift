class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack: [(index: Int, temperature: Int)] = []

        for (index, temperature) in temperatures.enumerated() {
            if stack.isEmpty || temperature <= stack.last!.temperature {
                stack.append((index, temperature))
            } else {
                while let last = stack.last, temperature > last.temperature {
                    result[last.index] = index - last.index
                    _ = stack.removeLast()
                }
                stack.append((index, temperature))
            }
        }

        return result
    }
}