extension String {
    func repeated(count: Int) -> String {
        .init(repeating: self, count: count)
    }
}

class Solution {

    func intToRoman(_ num: Int) -> String {

        var num = num
        var result = ""

        let topBounds = [
            (1000, "M"),
            (900, "CM"),
            (500, "D"),
            (400, "CD"),
            (100, "C"),
            (90, "XC"),
            (50, "L"),
            (40, "XL"),
            (10, "X"),
            (9, "IX"),
            (5, "V"),
            (4, "IV"),
            (1, "I"),
        ]

        for topBound in topBounds {
            let bound = topBound.0
            let symbol = topBound.1

            let count = num / bound
            result += symbol.repeated(count: count)
            num -= bound * count
        }

        return result
    }
}