extension Array {
    subscript(back index: Int) -> Element {
        self[endIndex.advanced(by: index)]
    }

    subscript(safeBack index: Int) -> Element? {
        indices ~= endIndex.advanced(by: index) ? self[back: index] : nil
    }
}

class Solution {

    private let operations: [String: (Int, Int) -> Int] = [
        "+": { $0 + $1 },
        "-": { $0 - $1 },
        "*": { $0 * $1 },
        "/": { $0 / $1 }
    ]

    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [String] = []

        for token in tokens {
            stack.append(token)
            while
                let a = stack[safeBack: -3],
                let b = stack[safeBack: -2],
                let op = stack[safeBack: -1],
                let x = Int(a),
                let y = Int(b),
                let operation = operations[op] {
                stack.removeLast(3)
                stack.append(String(operation(x, y)))
            }
        }

        return Int(stack.first!)!
    }
}