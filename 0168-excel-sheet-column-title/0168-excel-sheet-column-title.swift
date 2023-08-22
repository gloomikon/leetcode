class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var (result, columnNumber) = ("", columnNumber)
        while columnNumber > 0 {
            columnNumber -= 1
            let unicodeScalar = UnicodeScalar((columnNumber % 26) + Int(("A" as UnicodeScalar).value))!
            result.append(Character(unicodeScalar))
            columnNumber /= 26
        }
        return String(result.reversed())
    }
}