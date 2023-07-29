/**
 * Definition for singly-linked list.
 * public class ListNode: CustomStringConvertible {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 *
 *     public var description: String {
 *         var s = ""
 *         var curr: ListNode? = self
 *         while curr != nil {
 *             s += "\(curr!.val) "
 *             curr = curr?.next
 *         }
 *         return s.trimmingCharacters(in: .whitespaces)
 *      }
 * }
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var (prev, slow, fast) = (head, head, head)

        for _ in 1...n {
            fast = fast?.next
        }

        while fast != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next
        }

        if slow === head {
            return slow?.next
        }

        prev?.next = slow?.next

        return head
    }
}