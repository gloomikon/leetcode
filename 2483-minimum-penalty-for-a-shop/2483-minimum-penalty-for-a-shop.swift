class Solution {
    func bestClosingTime(_ customers: String) -> Int {
        let customers = Array(customers)
        var (minPenalty, curPenalty, earliestHour) = (0, 0, 0)

        for i in customers.indices {
            switch customers[i] {
            case "Y":
                curPenalty -= 1
            case "N":
                curPenalty += 1
            default:
                break
            }

            if curPenalty < minPenalty {
                earliestHour = i + 1
                minPenalty = curPenalty
            }
        }

        return earliestHour
    }
}