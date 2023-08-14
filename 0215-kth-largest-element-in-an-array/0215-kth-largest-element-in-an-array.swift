struct MinHeap<Element>: ExpressibleByArrayLiteral where Element: Comparable {

    init(arrayLiteral elements: Element...) {
        for element in elements {
            add(element)
        }
    }

    private var items: [Element] = []

    var count: Int {
        items.count
    }

    subscript(index: Int) -> Element {
        items[index]
    }

    //Get Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }

    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }

    // Return Item From Heap
    private func leftChild(_ index: Int) -> Element {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Element {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Element {
        return items[getParentIndex(index)]
    }

    // Heap Operations
    mutating private func swap(indexOne: Int, indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    }

    public func peek() -> Element {
        if items.count != 0 {
            return items[0]
        } else {
            fatalError()
        }
    }

    @discardableResult
    mutating public func pop() -> Element {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }

    mutating public func add(_ item: Element) {
        items.append(item)
        heapifyUp()
    }

    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) > items[index] {
            swap(indexOne: getParentIndex(index), indexTwo: index)
            index = getParentIndex(index)
        }
    }

    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }

            if items[index] < items[smallerChildIndex] {
                break
            } else {
                swap(indexOne: index, indexTwo: smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }
}

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap: MinHeap<Int> = []
        for num in nums {
            heap.add(num)
            if heap.count > k {
                heap.pop()
            }
        }
        return heap[0]
    }
}