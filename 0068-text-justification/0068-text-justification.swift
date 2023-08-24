class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        
        var result = [String]()
        var wordsForUse = words
        
        while wordsForUse.count > 0 {
            // Find words for the line: `total letters count` + `gap count` should be < maxWidth
            var lineWords = [String]()
            var wordsLenght = 0
            var nextWord: String? = wordsForUse.first
            while nextWord != nil {
                if let word = nextWord {
                    let numberOfGaps = max(lineWords.count - 1, 0)
                    let spaceOffset = lineWords.count - 1
                    if word.count + wordsLenght + spaceOffset < maxWidth {
                        lineWords.append(word)
                        wordsLenght += word.count
                        wordsForUse.removeFirst()
                        nextWord = wordsForUse.first
                    } else {
                        nextWord = nil
                    }
                }
            }
            
            var resultLine = ""
            let numberOfGaps = max(lineWords.count - 1, 0)
            
            var spaceCount = maxWidth - wordsLenght
            
            let isLastLine = wordsForUse.isEmpty
            if isLastLine {
                resultLine += lineWords.joined(separator: " ")
                resultLine += String(repeating: " ", count: spaceCount - numberOfGaps)
            } else if lineWords.count == 1 {
                resultLine += lineWords.first!
                resultLine += String(repeating: " ", count: spaceCount)
            } else {
                // Just add a space to each gap until all spaces are used
                var gapIndex = 0
                while spaceCount > 0 {
                    lineWords[gapIndex] += " "
                    spaceCount -= 1
                    if gapIndex + 1 < numberOfGaps {
                        gapIndex += 1
                    } else {
                        gapIndex = 0
                    }
                }
                resultLine += lineWords.joined(separator: "")
            }
            result.append(resultLine)
        }
        return result
    }
}