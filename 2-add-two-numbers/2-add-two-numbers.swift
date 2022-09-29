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

    private var transfer = 0

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && transfer == 0 {
            return nil
        }

        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + transfer
        transfer = sum / 10

        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}