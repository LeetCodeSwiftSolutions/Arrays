/* ELIMINAR DUPLICADOS DE UN ARREGLO ORDENADO.
Dado un arreglo de enteros ordenado de forma no decreciente, elimina los duplicados in situ para que cada elemento único aparezca solo una vez, manteniendo el orden relativo. Devuelve el número de elementos únicos k, con los primeros k elementos del arreglo conteniendo los únicos en orden. La longitud del arreglo está entre 1 y 3×10⁴, y los valores entre -100 y 100.

Given an integer array sorted in non-decreasing order, remove duplicates in-place so that each unique element appears only once, preserving the relative order. Return the number of unique elements k, with the first k array elements containing the unique numbers in order. The array length ranges from 1 to 3×10⁴, and values are between -100 and 100. */

/// Original solution. Time Complexity: O(n), Space complexity: O(1). Beats 100% & 96%
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var pos = 1
    for i in 1..<nums.count {
        if (nums[i] != nums[i-1]) {
            nums[pos] = nums[i]
            pos += 1
        }
    }
    return pos
}

/// Test cases
var nums = [5, 10, 15, 15, 20, 20, 20, 30]
removeDuplicates(&nums) // Expected: 5 (nums = [5, 10, 15, 20, 30, 20, 20, 30])
nums = [-30, -29, -29, -28, -27, -27, -25, -25]
removeDuplicates(&nums) // Expected: 5 (nums = [-30, -29, -28, -27, -25, -27, -25, -25]
nums = [-10, -9, -5, -5, -5, -4, -1, 0, 5, 7, 9]
removeDuplicates(&nums) // Expected: 9 (nums = [-10, -9, -5, -4, -1, 0, 5, 7, 9, 7, 9])
