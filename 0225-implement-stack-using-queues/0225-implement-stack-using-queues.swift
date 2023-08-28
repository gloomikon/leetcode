class MyStack {
    
    private var stack: [Int] = []
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
    }
    
    func pop() -> Int {
        stack.removeLast()
    }
    
    func top() -> Int {
        stack.last!
    }
    
    func empty() -> Bool {
        stack.isEmpty
    }
}