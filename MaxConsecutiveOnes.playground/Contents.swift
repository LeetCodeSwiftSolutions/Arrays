/* NÚMERO MÁXIMO DE UNOS CONSECUTIVOS
Dado un arreglo binario nums, devuelve el máximo número de unos consecutivos en el arreglo. La longitud está entre 1 y 10⁵, y cada elemento es 0 o 1.

Given a binary array nums, return the maximum number of consecutive 1's in the array. The length ranges from 1 to 10⁵, and each element is either 0 or 1. */

/// Solución original. Time Complexity: O(n). Beats 100% and 30%
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var count = 0
    var result = 0
    for i in 0..<nums.count {
        if nums[i] == 1 { count += 1 }
        else {
            result = max(count, result)
            count = 0
        }
    }
    result = max(count, result)
    return result
}


/// Pruebas
findMaxConsecutiveOnes([1,1,0,1,1,1]) // Expected: 3
findMaxConsecutiveOnes([1,0,1]) // Expected: 1
findMaxConsecutiveOnes([0]) // Expected: 0


