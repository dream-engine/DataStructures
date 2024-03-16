//
//  DSLinkedList.swift
//  DataStructures
//
//  Created by Mohit Kumar Singh on 10/03/24.
//

import Foundation

protocol DSLinkedListProtocol {
    func runLinkedListQuestion()
}

extension DSLinkedListProtocol {
    func runLinkedListQuestion() {
        
    }
}


//  Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 

class DSLinkedList {
    
    // MARK: 21: Merge Two Sorted Lists
    ///You are given the heads of two sorted linked lists list1 and list2.
    ///
    /// Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
    ///
    /// Return the head of the merged linked list.
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func mergeTwoLists21(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil { return nil }
        
        var l1 = list1
        var l2 = list2
        
        var result: ListNode? = ListNode(-1)
        var current = result
        
        while l1 != nil && l2 != nil {
            let val1 = l1!.val
            let val2 = l2!.val
            
            if val1 <= val2 {
                current?.next = l1
                l1 = l1?.next
            } else {
                current?.next = l2
                l2 = l2?.next
            }
            current = current?.next
        }
        
        if l1 != nil {
            current?.next = l1
        }
        
        if l2 != nil {
            current?.next = l2
        }
        
        return result?.next
    }
    
    // MARK: 83: Delete Duplicates
    /// Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
    ///
    /// Example 1:
    /// Input: head = [1,1,2]
    /// Output: [1,2]
    ///
    /// Example 2:
    /// Input: head = [1,1,2,3,3]
    /// Output: [1,2,3]
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func deleteDuplicates83(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var current = head
        
        while current != nil {
            let next = current?.next
            
            if next?.val == current?.val {
                current?.next = next?.next
            } else {
                current = current?.next
            }
        }
        
        return head
        
    }
    
    // MARK: 141: Has Cycle
    /// Floyd's cycle detection algorithm: It has two parts, we need only first part for this question
    ///  1st part: To prove that it has a cycle
    ///  2nd part:  Find out the starting point of the cycle
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func hasCycle141(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next // Fast will move two times faster
            
            if fast === slow { // If fast and slow are same, has cycle
                return true
            }
        }
        
        return false
    }
    
    // MARK: 203: Remove LL Elements
    /// Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.
    ///
    /// Example 1:
    /// Input: head = [1,2,6,3,4,5,6], val = 6
    /// Output: [1,2,3,4,5]
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var current: ListNode? = ListNode(-1)
        current?.next = head
        
        var temp = current
        
        while temp != nil {
            let next = temp?.next
            
            if next?.val == val {
                temp?.next = next?.next
            } else {
                temp = temp?.next
            }
        }
        
        return current?.next
    }
    
    // MARK: 206: Reverse LL
    /// Given the head of a singly linked list, reverse the list, and return the reversed list.
    ///
    /// Example 1:
    /// Input: head = [1,2,3,4,5]
    /// Output: [5,4,3,2,1]
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func reverseList(_ head: ListNode?) -> ListNode? {
        var reverse: ListNode?
        var temp = reverse
        var current = head
        
        while current != nil {
            temp = reverse
            reverse = current
            current = current?.next
            reverse?.next = temp
            
        }
        
        return reverse
    }
    
    // MARK: 876: Middle of the Linked List
    ///Given the head of a singly linked list, return the middle node of the linked list.
    
    ///If there are two middle nodes, return the second middle node.
    ///Input: head = [1,2,3,4,5]
    ///Output: [3,4,5]
    ///Explanation: The middle node of the list is node 3.
    ///
    ///Input: head = [1,2,3,4,5,6]
    ///Output: [4,5,6]
    ///Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var slow = head
        var fast = head
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    // MARK: 2: Add Two Numbers
    ///You are given two non-empty linked lists representing two non-negative integers.
    ///The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
    ///
    ///You may assume the two numbers do not contain any leading zero, except the number 0 itself.
    ///
    ///Example 1:
    ///Input: l1 = [2,4,3], l2 = [5,6,4]
    ///Output: [7,0,8]
    ///Explanation: 342 + 465 = 807.
    ///
    ///Example 2:
    ///Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
    ///Output: [8,9,9,9,0,0,0,1]
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(n) creating same number of list nodes
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        
        var result: ListNode? = ListNode(-1)
        var current = result
        var first: ListNode? = l1
        var second: ListNode? = l2
        
        while first != nil || second != nil {
            let sum = carry + (first?.val ?? 0) + (second?.val ?? 0)
            current?.next = ListNode(sum % 10)
            carry = sum / 10
            current = current?.next
            first = first?.next
            second = second?.next
        }
        
        if carry > 0 {
            current?.next = ListNode(carry)
        }
        
        return result?.next
    }
}
