class Solution {

    private var memo: [Int: [TreeNode]] = [:]

    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        if n % 2 == 0 { return [] }
        if n == 1 { return [.init()] }
        if let array = memo[n] { return array }

        var res: [TreeNode] = []

        for i in 1..<n where i % 2 == 1 {
            let left = allPossibleFBT(i)
            let right = allPossibleFBT(n - i - 1)

            for left in left {
                for right in right {
                    let root = TreeNode()
                    root.left = left
                    root.right = right
                    res.append(root)
                }
            }
        }

        memo[n] = res

        return res
    }
}