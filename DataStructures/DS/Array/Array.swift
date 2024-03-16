//
//  Array.swift
//  DataStructures
//
//  Created by Mohit Kumar Singh on 10/03/24.
//

import UIKit

protocol ArrayTop150QuestionsProtocol {
    
}

protocol ArrayQuestionsProtocol: AnyObject {
    func runArrayQuestion()
}

extension ArrayQuestionsProtocol {
    func runArrayQuestion() {
        _ = DSArray.twoSum1(nums: [1, 3, 5, 2, 8, 7, 9, 6], target: 13)
    }
}


class DSArray: ArrayQuestionsProtocol {
    
    // MARK: 1: Two Sum 1
    /// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    ///
    ///You may assume that each input would have exactly one solution, and you may not use the same element twice.
    ///
    ///You can return the answer in any order.
    /// - Parameters:
    ///   - nums: Integer Array is Unsorted
    ///   - target: Target of sum
    /// - Returns: [Indexes of numbers that add upto target]
    ///
    /// Input: nums = [2,7,11,15], target = 9
    /// Output: [0,1]
    /// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
    /// Time Complexity: O(n)
    /// Space Complexity: O(n)
    static func twoSum1(nums: [Int], target: Int) -> [Int] { // LC1
        var dictionary = [Int: Int]()
        
        for index in 0..<nums.count {
            if let availableIndex = dictionary[target - nums[index]] {
                return [index, availableIndex]
            } else {
                dictionary[nums[index]] = index
            }
        }
        
        return [-1]
                            
    }
    
    /// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    ///
    ///You may assume that each input would have exactly one solution, and you may not use the same element twice.
    ///
    ///You can return the answer in any order.
    /// - Parameters:
    ///   - nums: Integer Array Sorted
    ///   - target: Target of sum
    /// - Returns: [Indexes of numbers that add upto target]
    ///
    /// Input: nums = [2,7,11,15], target = 9
    /// Output: [0,1]
    /// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    static func twoSum2(nums: [Int], target: Int) -> [Int] {
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            if nums[start] + nums[end] < target {
                start += 1
            } else if nums[start] + nums[end] > target {
                end -= 1
            } else {
                return [start, end]
            }
        }
        
        return [-1]
                            
    }
    
    // MARK: 88: Merge Sorted Arrays
    ///You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
    ///
    ///Merge nums1 and nums2 into a single array sorted in non-decreasing order.
    ///
    ///The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
    ///
    ///
    /// Example 1:
    /// Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
    /// Output: [1,2,2,3,5,6]
    /// Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
    /// The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func merge88(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) { // LC88
        var i = m - 1
        var j = n - 1
        var k = nums1.count - 1
        
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
                k -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
                k -= 1
            }
        }
        
        while j >= 0 { // If elements are left in nums2
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
        
    }
    
    // MARK: 27: Remove Element
    /// Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.
    ///
    /// Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:
    ///
    /// Change the array nums such that the first k elements of nums contain the elements which are not equal to val. The remaining elements of nums are not important as well as the size of nums.
    /// Return k.
    ///
    /// int[] nums = [...]; // Input array
    /// int val = ...; // Value to remove
    /// int[] expectedNums = [...]; // The expected answer with correct length.
                                // It is sorted with no values equaling val.

    /// int k = removeElement(nums, val); // Calls your implementation

    /// assert k == expectedNums.length;
    /// sort(nums, 0, k); // Sort the first k elements of nums
    /// for (int i = 0; i < actualLength; i++) {
    ///     assert nums[i] == expectedNums[i];
    /// }
    ///
    /// Input: nums = [3,2,2,3], val = 3
    /// Output: 2, nums = [2,2,_,_]
    /// Explanation: Your function should return k = 2, with the first two elements of nums being 2.
    /// It does not matter what you leave beyond the returned k (hence they are underscores).
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func removeElement27(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = 0
        
        while i < nums.count {
            if nums[i] == val {
                
            } else {
                nums[j] = nums[i]
                j += 1
            }
            i += 1
        }
        
        return j
    }
    
    // MARK: 26: Remove Duplicates
    /// Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
    ///
    /// Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
    ///
    /// Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
    /// Return k.
    ///
    ///
    /// Example 1:
    /// Input: nums = [1,1,2]
    /// Output: 2, nums = [1,2,_]
    /// Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
    /// It does not matter what you leave beyond the returned k (hence they are underscores).
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    func removeDuplicates26(_ nums: inout [Int]) -> Int {
        var i = 1
        var j = 0
        
        while i < nums.count {
            if nums[i] == nums[j] {
                
            } else {
                j += 1
                nums[j] = nums[i]
            }
            
            i += 1
        }
        
        return j+1
    }
    
    // MARK: 80: Remove Duplicates 2
    /// Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.
    ///
    /// Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.
    ///
    /// Return k after placing the final result in the first k slots of nums.
    ///
    /// Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
    ///
    ///
    /// Input: nums = [1,1,1,2,2,3]
    /// Output: 5, nums = [1,1,2,2,3,_]
    /// Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
    /// It does not matter what you leave beyond the returned k (hence they are underscores).
    ///
    /// Time Complexity: O(n)
    /// Space Complexity: O(1)
    class Solution {
        func removeDuplicates80(_ nums: inout [Int]) -> Int {
            return 0
        }
    }
    
    
    ///Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
    
    /// Each row must contain the digits 1-9 without repetition.
    /// Each column must contain the digits 1-9 without repetition.
    /// Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
    /// Note:

    /// A Sudoku board (partially filled) could be valid but is not necessarily solvable.
    /// Only the filled cells need to be validated according to the mentioned rules.
    /// Input: board =
    // [["5","3",".",".","7",".",".",".","."]
    // ,["6",".",".","1","9","5",".",".","."]
    // ,[".","9","8",".",".",".",".","6","."]
    // ,["8",".",".",".","6",".",".",".","3"]
    // ,["4",".",".","8",".","3",".",".","1"]
    // ,["7",".",".",".","2",".",".",".","6"]
    // ,[".","6",".",".",".",".","2","8","."]
    // ,[".",".",".","4","1","9",".",".","5"]
    // ,[".",".",".",".","8",".",".","7","9"]]
    /// Output: true
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        return false
    }
    
}
