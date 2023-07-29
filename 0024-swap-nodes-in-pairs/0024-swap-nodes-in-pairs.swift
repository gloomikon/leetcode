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

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var (head, prev, a, b) = (head, ListNode?.none, head, head?.next)
        while a != nil, b != nil {
            // swap a & b
            a?.next = b?.next
            b?.next = a

            // if was already swaped
            if let prev = prev {
                prev.next = b
            } else {
                head = b
            }

            prev = a
            a = a?.next
            b = a?.next
        }

        return head
    }
}