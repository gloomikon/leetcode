extension Array {
    subscript(safe index: Int, default: Element) -> Element {
        indices ~= index ? self[index] : `default`
    }
}

class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var (small, big) = ([Int](), [Int]())

        for i in 1...Int(sqrt(Double(n))) {
            if n % i == 0 {
                let (s, b) = (i, n / i)
                small.append(s)
                if s != b {
                    big.append(b)
                }
            }
        }

        let all = small + big.reversed()
        return all[safe: k - 1, -1]
    }
}