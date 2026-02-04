/* 27. Remove element [easy] - Array, Two Pointers
 Dado un arreglo de enteros nums y un entero val, elimina todas las ocurrencias de val en nums por referencia (in-place). El orden de los elementos puede cambiar. Una vez eliminados, regresa el número de elementos en nums que no son iguales a val.

 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val. */

///
/// Original solution.
/// Time Complexity: O(n), Space complexity: O(1).
/// Beats 100% & 90%
///
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    // Two Pointers
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        if nums[right] == val {
            // We position the "right" pointer at the index of the first element different from "val", scanning from right to left.
            right -= 1
        } else if nums[left] == val {
            // If the left pointer points to "val", we swap the elements at left and right.
            (nums[left], nums[right]) = (nums[right], nums[left])
            left += 1
            right -= 1
        } else {
            left += 1
        }
    }

    return left
}

///
/// Original test cases
///
var nums = [-5, -5, -5, 0, 1, 4, 5, 7, 8, 10]
removeElement(&nums, -5)
// Expected: [10, 8, 7, 0, 1, 4, 5, -5, -5, -5]

nums = [2, 3, 4, 5, 6, 7, 8]
removeElement(&nums, 100)
// Expected: [2, 3, 4, 5, 6, 7, 8]

nums = [10, 20, 30, 30, 40, 50, 10, 10]
removeElement(&nums, 10)
// Expected: [50, 20, 30, 30, 40, 10, 10, 10]
