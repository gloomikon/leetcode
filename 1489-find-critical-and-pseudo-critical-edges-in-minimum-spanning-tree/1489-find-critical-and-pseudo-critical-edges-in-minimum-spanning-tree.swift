/// UnionFind is a data structure that can keep track of a set of elements partitioned into a number of disjoint (non-overlapping) subsets
public struct UnionFind<T: Hashable> {

    private var index = [T: Int]()
    private var parent = [Int]()
    public var size = [Int]()

    /// Creates an empty ``UnionFind``
    public init() { }

    /// Creates an ``UnionFind`` filled with elements
    /// - Parameter elements: elements to fill the ``UnionFind`` with
    public init(with elements: Set<T>) {
        elements.forEach {
            addSetWith($0)
        }
    }

    public mutating func addSetWith(_ element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        size.append(1)
    }

    public mutating func setOf(_ element: T) -> Int? {
        index[element].map { setByIndex($0) }
    }

    private mutating func setByIndex(_ index: Int) -> Int {
        if parent[index] == index {
            return index
        } else {
            parent[index] = setByIndex(parent[index])
            return parent[index]
        }
    }

    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = setOf(firstElement),
           let secondSet = setOf(secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }

    @discardableResult
    public mutating func union(_ firstElement: T, and secondElement: T) -> Bool {
        guard let firstSet = setOf(firstElement),
              let secondSet = setOf(secondElement),
              firstSet != secondSet else {
            return false
        }

        if size[firstSet] < size[secondSet] {
            parent[firstSet] = secondSet
            size[secondSet] += size[firstSet]
        } else {
            parent[secondSet] = firstSet
            size[firstSet] += size[secondSet]
        }

        return true
    }
}

class Solution {
    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        var edges = edges
        edges = edges.enumerated().map { index, edge in edge + [index] } // [v1, v2, weight, originalIndex]

        edges.sort { lhs, rhs in lhs[2] < rhs[2] } // sort by weight

        var (mstWeight, uf) = (0, UnionFind(with: Set(0..<n)))

        for edge in edges {
            let (v1, v2, weight) = (edge[0], edge[1], edge[2])
            if uf.union(v1, and: v2) {
                mstWeight += weight
            }
        }

        var critical: [Int] = []
        var pseudo: [Int] = []

        for edge in edges {
            let (n1, n2, w, i) = (edge[0], edge[1], edge[2], edge[3])

            // Try find MST w/o current edge
            var weight = 0
            var uf = UnionFind(with: Set(0..<n))

            for edge in edges {
                let (v1, v2, w, j) = (edge[0], edge[1], edge[2], edge[3])
                if i != j, uf.union(v1, and: v2) {
                    weight += w
                }
            }

            if uf.size.max() != n || weight > mstWeight {
                critical.append(i)
                continue
            }

            // Try find MST WITH current edge
            uf = UnionFind(with: Set(0..<n))
            uf.union(n1, and: n2)
            weight = w
            for edge in edges {
                let (v1, v2, w) = (edge[0], edge[1], edge[2])
                if uf.union(v1, and: v2) {
                    weight += w
                }
            }
            if weight == mstWeight {
                pseudo.append(i)
            }
        }

        return [critical, pseudo]
    }
}
