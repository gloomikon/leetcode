class Solution {
   func strangePrinter(_ s: String) -> Int {
       let (a, n) = (Array(s), s.count)
       var dp: [[Int]] = .init(repeating: .init(repeating: n, count: n), count: n)

       for length in 1...n {
           for l in 0...n - length {
               let r = l + length - 1
               var j = -1
               for i in l..<r {
                   if a[i] != a[r] && j == -1 {
                       j = i
                   }
                   if j != -1 {
                       dp[l][r] = min(dp[l][r], 1 + dp[j][i] + dp[i + 1][r])
                   }
               }
               if j == -1 {
                   dp[l][r] = 0
               }
           }
       }

       return dp[0][n - 1] + 1
   }

//     func strangePrinter(_ s: String) -> Int {
//         let (a, n) = (Array(s), s.count)
//         var dp: [[Int?]] = .init(repeating: .init(repeating: nil, count: n), count: n)

//         func solve(_ l: Int, _ r: Int) -> Int {
//             if let value = dp[l][r] {
//                 return value
//             }

//             dp[l][r] = n
//             var j: Int?
//             for i in l..<r {
//                 if a[i] != a[r] && j == nil {
//                     j = i
//                 }
//                 if let j = j {
//                     dp[l][r] = min(dp[l][r]!, 1 + solve(j, i) + solve(i + 1, r))
//                 }
//             }
//             if j == nil {
//                 dp[l][r] = 0
//             }

//             return dp[l][r]!
//         }

//         return solve(0, n - 1) + 1
//     }
}