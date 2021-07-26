//
//  MedianOfTwoSortedArray.swift
//  demo
//
//  Created by inenpruthibh1m2 on 26/07/21.
//

import Foundation
class MedianOfTwoSortedArray {
   func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var i = 0
        var j = 0
        var mergedArr = [Int]()
        while ( i < nums1.count || j < nums2.count ) {
            if i >= nums1.count {
                mergedArr.append(contentsOf: nums2[j...nums2.count-1])
                j += nums2.count
            } else if (j >= nums2.count) {
                mergedArr.append(contentsOf: nums1[i...nums1.count-1])
                i += nums1.count
            } else {
                if nums1[i] < nums2[j] {
                    mergedArr.append(nums1[i])
                    i += 1
                } else {
                    mergedArr.append(nums2[j])
                    j += 1
                }
            }
        }
       
        //Calculate median
        let count = mergedArr.count
        
        if count == 0 {
            return 0
        }
        let isOddArr = count % 2
        if isOddArr == 0 {
            let n = (count) / 2
            let median = ( mergedArr[n] + mergedArr[n+1] ) / 2
            return Double(median)
        } else {
            let n = (count) / 2
            return Double(mergedArr[n])
        }
    }
}
