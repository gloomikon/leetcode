extension Array where Element == String {
    func merge(with otherArray: Self) -> Self {
        if isEmpty { return otherArray }
        if otherArray.isEmpty { return self }
        return flatMap { a in
            otherArray.map { b in
                a + b
            }
        }
    }
}

class Solution {

    private let keyboardMap: [Character: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        digits.reduce([]) { prev, digit in
            prev.merge(with: keyboardMap[digit]!)
        }
    }
}