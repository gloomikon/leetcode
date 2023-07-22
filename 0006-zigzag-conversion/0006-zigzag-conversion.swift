class Solution {
    func convert(_ s: String, _ n: Int) -> String {
        if n == 1 { return s }
        let array = Array(s)
        let size = array.count


        var output: [Character] = .init()
        output.reserveCapacity(size)
        let offset = 2 * n - 2

        for i in 0..<n {
            var step = 0
            var index = i

            while index < size {
                output.append(array[index])
                step += 1
                if step == 1 && i == n - 1 {
                    step += 1
                }
                index = i + step * offset - 2 * i

                if i != 0 && i != n - 1 && index < size {
                    output.append(array[index])
                    index = i + step * offset
                }
            }
        }

        return String(output)
    }
}
