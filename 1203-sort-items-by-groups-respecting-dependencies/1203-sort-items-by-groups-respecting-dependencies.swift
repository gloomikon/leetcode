class Solution {
    func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
        // Create a separate group for each non-grouped item.
        var (group, groupCount) = (group, m)

        // Set group number for items w/o group
        for item in group.indices {
            if group[item] == -1 {
                group[item] = groupCount
                groupCount += 1
            }
        }

        // Sort all item regardless of group dependencies.
        var itemGraph: [[Int]] = .init(repeating: [], count: n)
        var itemIndegree: [Int] = .init(repeating: 0, count: n)

        // Sort all groups regardless of item dependencies.
        var groupGraph: [[Int]] = .init(repeating: [], count: groupCount)
        var groupIndegree: [Int] = .init(repeating: 0, count: groupCount)

        for curr in 0..<n {
            for prev in beforeItems[curr] {
                // Each (prev -> curr) represents an edge in the item graph
                itemGraph[prev].append(curr)
                itemIndegree[curr] += 1

                // If they belong to different groups, add an edge in the group graph
                if group[curr] != group[prev] {
                    groupGraph[group[prev]].append(group[curr])
                    groupIndegree[group[curr]] += 1
                }
            }
        }

        // Topological sort nodes in graph, return [] if a cycle exists.
        func topologicalSort(graph: [[Int]], indegree: [Int]) -> [Int] {
            var indegree = indegree
            var visited: [Int] = []
            var stack = (0..<graph.count).filter { node in indegree[node] == 0 }
            while !stack.isEmpty {
                let curr = stack.removeLast()
                visited.append(curr)
                for neib in graph[curr] {
                    indegree[neib] -= 1
                    if indegree[neib] == 0 {
                        stack.append(neib)
                    }
                }
            }

            return visited.count == graph.count ? visited : []
        }

        let itemOrder = topologicalSort(graph: itemGraph, indegree: itemIndegree)
        let groupOrder = topologicalSort(graph: groupGraph, indegree: groupIndegree)

        if itemOrder.isEmpty || groupOrder.isEmpty { return [] }

        // Items are sorted regardless of groups, we need to
        // differentiate them by the groups they belong to
        var orderedGroups: [Int: [Int]] = [:]
        for item in itemOrder {
            orderedGroups[group[item], default: []].append(item)
        }

        // Concatenate sorted items in all sorted groups
        // [group 1, group 2, ... ] -> [(item 1, item 2, ...), (item 1, item 2, ...), ...
        let answer = groupOrder.flatMap { orderedGroups[$0, default: []] }
        return answer
    }
}