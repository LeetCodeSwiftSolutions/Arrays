/* LONGITUD MÍNIMA DE UNA SUBARREGLO
Dado un arreglo de enteros positivos nums y un entero positivo target, encuentra la longitud mínima de un subarreglo contiguo cuya suma sea mayor o igual a target. Si no existe, devuelve 0. La longitud del arreglo está entre 1 y 10⁵, los elementos entre 1 y 10⁴, y target entre 1 y 10⁹.

Given an array of positive integers nums and a positive integer target, find the minimal length of a contiguous subarray whose sum is greater than or equal to target. If none exists, return 0. The array length ranges from 1 to 10⁵, elements are between 1 and 10⁴, and target is between 1 and 10⁹.*/

/// Solution learned from Deepseek. Time complexity: O(n), Space complexity: O(1). Beats 100% & 50%
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var left = 0
    var currentSum = 0
    var minSize = Int.max
    // For each "left", we find the minimum "right" that makes the window valid, then enter the while loop
    for right in 0 ..< nums.count {
        // Add to currentSum the value we're adding to the window on the right
        currentSum += nums[right]
        // While the window is valid, we increment "left" looking for a potentially shorter window
        while currentSum >= target {
            // Update minSize
            minSize = min(minSize, right-left+1)
            // Subtract from currentSum the value we're removing from the window on the left
            currentSum -= nums[left]
            left += 1
        }
    }
    // If the while loop was never executed, minSize remains at its original value, indicating no valid windows
    return minSize == Int.max ? 0 : minSize
}

/// Test cases
minSubArrayLen(7, [1, 2, 3, 4, 5, 6, 7, 8]) // Expected: 1
minSubArrayLen(7, [2, 3, 1, 2, 4, 3]) // Expected: 2
