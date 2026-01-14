/* MÁXIMO SUBARREGLO DE UNOS CONSECUTIVO III
Dado un arreglo binario nums y un entero k, encuentra la longitud máxima de un subarreglo contiguo que contenga solo unos después de convertir a lo sumo k ceros en unos. La longitud del arreglo está entre 1 y 10⁵, y k entre 0 y la longitud del arreglo.

Given a binary array nums and an integer k, find the maximum length of a contiguous subarray containing only 1's after flipping at most k zeros to ones. The array length ranges from 1 to 10⁵, and k is between 0 and the array length.
 */

/// Original solution. Time complexity: O(n), Space complexity: O(1). Beats 100% & 84%
func longestOnes(_ nums: [Int], _ k: Int) -> Int {
    var left = 0
    var current = 0
    var zeroCount = 0
    var maxConsecutive = 0
    for right in 0 ..< nums.count {
        if (nums[right] == 1) || (zeroCount < k) {
            current += 1
            if nums[right] == 0 { zeroCount += 1 }
            maxConsecutive = max(current, maxConsecutive)
        } else {
            while zeroCount == k {
                if nums[left] == 0 { zeroCount -= 1 }
                current -= 1
                left += 1
            }
            current += 1
            zeroCount += 1
        }
    }
    return maxConsecutive
}

/// Test cases
longestOnes([0,0,1,1], 1) // Expected: 3
longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2) // Expected: 6
longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3) // Expected: 10

