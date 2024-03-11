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
}
