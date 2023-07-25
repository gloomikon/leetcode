class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n < 0 { return 1 / myPow(x, -n) }
        
        return n % 2 == 0 ?
        myPow(x * x, n / 2) :
        x * myPow(x * x, n / 2)
    }
}