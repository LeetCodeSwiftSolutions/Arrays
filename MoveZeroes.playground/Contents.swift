/* MOVER CEROS.
Dado un arreglo de enteros, mueve todos los ceros al final manteniendo el orden relativo de los elementos distintos de cero, modificando el arreglo in situ. La longitud está entre 1 y 10⁴, y los valores están en el rango de enteros de 32 bits con signo.

Given an integer array, move all zeros to the end while preserving the relative order of non-zero elements, modifying the array in-place. The length ranges from 1 to 10⁴, and values are in the 32-bit signed integer range. */

/// Original solution. Time complexity: O(n), Space complexity: O(1). Beats 100% & 24%
func moveZeroes(_ nums: inout [Int]) {
    var pos = 0
    var count = 0
    let n = nums.count
    for i in 0..<n {
        if nums[i] != 0 {
            nums[pos] = nums[i]
            pos += 1
        } else { count += 1 }
    }
    for i in (n-count..<n).reversed() {
        nums[i] = 0
    }
}

/// Test cases
var nums1 = [0,1,0,3,12]
moveZeroes(&nums1) // Expected: [1, 3, 12, 0, 0]

var nums2 = [-15155,27382,59818,0,-30645]
moveZeroes(&nums2) // Expected: [-15155, 27382, 59818, -30645, 0]
