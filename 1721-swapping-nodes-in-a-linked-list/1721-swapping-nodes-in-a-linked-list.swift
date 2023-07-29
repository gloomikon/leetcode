/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

class Solution {
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var array: [ListNode] = []
        var curr = head

        while curr != nil {
            array.append(curr!)
            curr = curr?.next
        }

        let n = array.count
        if k == n - k + 1 { return head }

        let prevAIndex = k - 2
        let aIndex = k - 1
        let prevBIndex = n - k - 1
        let bIndex = n - k

        let prevA = array[safe: prevAIndex]
        let a = array[aIndex]
        let prevB = array[safe: prevBIndex]
        let b = array[bIndex]

        // two nodes are adjacent
        if prevBIndex == aIndex || prevAIndex == bIndex {
            // (o->a->b->o)
            if let prevA = prevA, prevB != nil, aIndex < bIndex {
                let bNext = b.next
                prevA.next = b
                b.next = a
                a.next = bNext
                return head
            }
            // (o->b->a->o)
            else if let prevB = prevB, prevA != nil, bIndex < aIndex {
                let aNext = a.next
                prevB.next = a
                a.next = b
                b.next = aNext
                return head
            }
            // (a->b)
            else if aIndex < bIndex {
                b.next = a
                a.next = nil
                return b
            }
            // (b->a)
            else if bIndex < aIndex {
                a.next = b
                b.next = nil
                return a
            }
            else {
                fatalError("Impossible case")
            }
        }
        // (o->a->o->b->o)
        else if let prevA = prevA, let prevB = prevB {
            let bNext = b.next
            prevA.next = b
            b.next = a.next
            prevB.next = a
            a.next = bNext
            return head
        }
        // (b->o->a)
        else if let prevA = prevA {
            a.next = b.next // head?.next
            prevA.next = b
            b.next = nil
            return a
        }
        // (a->o->b)
        else if let prevB = prevB {
            b.next = a.next // head?.next
            prevB.next = a
            a.next = nil
            return b
        } else {
            fatalError("Impossible case")
        }
    }
}