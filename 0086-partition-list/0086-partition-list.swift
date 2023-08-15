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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var (left, right) = (ListNode(), ListNode())
        var (leftTail, rightTail) = (left, right)

        var head = head
        while let curr = head {
            if curr.val < x {
                leftTail.next = curr
                leftTail = curr
            } else {
                rightTail.next = curr
                rightTail = curr
            }
            head = head?.next
        }

        leftTail.next = right.next
        rightTail.next = nil
        return left.next
    }
}