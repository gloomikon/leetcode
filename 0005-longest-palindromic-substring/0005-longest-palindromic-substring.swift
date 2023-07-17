class Solution {

    func longestPalindrome(_ s: String) -> String {

        let length = s.count

        // Usage of array is
        let array = Array(s)

        if length <= 1 { return s }

        // Is a matrix LENGTH*LENGTH filled with Bools, representing the following:
        // dp[j][i] is true if s[j...i] is a palindrome
        var dp = Array.init(
            repeating: Array.init(
                repeating: false,
                count: length
            ),
            count: length
        )

        // The range of the longest palindrome string
        var left = 0
        var right = 0

        // We are interested to iterate through the part of matrix under the main diagonal
        // We will update the dp[j][i] if the first and last character of string are same (array[j] == array[i]
        // and if the string between these characters is a palindrome (dp[j + 1][i - 1])
        // Also, if the first condition is true and length of string is <= 2 (i - j <=2)
        // there is no need to check for the second condition
        for i in 1..<length {
            for j in 0..<(length - i) where array[j] == array[i + j] && (dp[j + 1][i + j - 1] || i <= 2) {
                dp[j][i + j] = true
                if i > right - left {
                    left = j
                    right = i + j
                }
            }
        }


        return String(array[left...right])
    }
}