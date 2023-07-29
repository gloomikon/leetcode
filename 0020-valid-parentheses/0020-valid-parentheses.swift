class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [String.Element] = []

        func openingParentheses(for c: Character) -> Character {
            if c == ")" { return "(" }
            if c == "]" { return "[" }
            if c == "}" { return "{" }
            fatalError()
        }

        for c in Array(s) {
            if ["(", "[", "{"].contains(c) {
                stack.append(c)
            } else {
                guard let last = stack.last, last == openingParentheses(for: c) else {
                    return false
                }
                _ = stack.popLast()
            }
        }

        return stack.isEmpty
    }
}