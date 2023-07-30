class Solution {

    private func abs(_ n: Int) -> Int {
        let CHAR_BIT = 8
        let mask = n >> (MemoryLayout<Int>.size * CHAR_BIT - 1)
        return (n + mask) ^ mask
    }

    private func negative(_ n: Int) -> Int {
        ~n + 1
    }

    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var quotient = 0
        let neg = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
        var dividend = abs(dividend)
        let divisor = abs(divisor)

        var i = 31
        repeat {
            if divisor << i <= dividend {
                dividend -= divisor << i
                quotient += 1 << i
            }
            i -= 1
        } while i >= 0

        quotient = neg ? negative(quotient) : quotient
        quotient = min(max(quotient, Int(Int32.min)), Int(Int32.max))

        return quotient
    }
}