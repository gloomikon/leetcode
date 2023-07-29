class Solution {

    private struct DP: Hashable {
        let a: Int
        let b: Int
    }

    func soupServings(_ n: Int) -> Double {
        var dp: [DP: Double] = [:]
        let m = Int(ceil(Double(n) / 25))
        if m == 0 { return 0.5 }
        if m > 200 { return 1 }

        func serve(_ a: Int, _ b: Int) -> Double {
            if a <= 0 && b <= 0 { return 0.5 }
            if a <= 0 { return 1 }
            if b <= 0 { return 0 }
            let DP = DP(a: a, b: b)
            if let probability = dp[DP] { return probability }
            let probability = (serve(a - 4, b) + serve(a - 3, b - 1) + serve(a - 2, b - 2) + serve(a - 1, b - 3)) / 4
            dp[DP] = probability
            return probability
        }

        return serve(m, m)
    }
}