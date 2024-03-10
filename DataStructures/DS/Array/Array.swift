//
//  Array.swift
//  DataStructures
//
//  Created by Mohit Kumar Singh on 10/03/24.
//

import Foundation

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

// MARK: DSArray
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
    /// Time Complexity: O(n)
    /// Space Complexity: O(n)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) { // LC88
        var i = m - 1
        var j = n - 1
        
        
    }
    
}
