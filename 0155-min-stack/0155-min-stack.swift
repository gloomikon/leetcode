class MinStack {

    struct Node {
        let value: Int
        let min: Int
    }

    private var array: [Node] = []

    init() { }

    func push(_ val: Int) {
        let min = array.isEmpty ? val : min(array.last!.min, val)
        array.append(.init(value: val, min: min))
    }

    func pop() {
        _ = array.popLast()
    }

    func top() -> Int {
        array.last!.value
    }

    func getMin() -> Int {
        array.last!.min
    }
}