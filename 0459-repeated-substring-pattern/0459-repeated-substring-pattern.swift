class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let a = Array(s)
        for i in 0..<a.count / 2 {
            guard a.count % (i + 1) == 0 else { continue }
            let substring = String(a[0...i])
            if s.components(separatedBy: substring)
                .compactMap({ $0.isEmpty ? nil : $0 })
                .isEmpty {
                return true
            }
        }
        return false
    }
}