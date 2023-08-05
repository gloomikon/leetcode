/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {

    private struct DP: Hashable {
        let lowerBound: Int
        let upperBound: Int
    }

    func generateTrees(_ n: Int) -> [TreeNode?] {

        var dp: [DP: [TreeNode]] = [:]

        func generate(_ lowerBound: Int, _ upperBound: Int) -> [TreeNode?] {
            if lowerBound > upperBound {
                return [nil]
            }

            let key = DP(lowerBound: lowerBound, upperBound: upperBound)

            if let result = dp[key] {
                return result
            }

            var res: [TreeNode] = []
            for val in lowerBound...upperBound {
                for left in generate(lowerBound, val - 1) {
                    for right in generate(val + 1, upperBound) {
                        let root = TreeNode(val, left, right)
                        res.append(root)
                    }
                }
            }

            dp[key] = res

            return res
        }

        return generate(1, n)
    }
}