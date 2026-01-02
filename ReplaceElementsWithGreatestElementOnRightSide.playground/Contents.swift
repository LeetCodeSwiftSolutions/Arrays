/* REEMPLAZO DE ELEMENTOS POR EL ELEMENTO MAYOR A LA DERECHA.
Dado un arreglo arr, reemplaza cada elemento por el mayor elemento a su derecha, y asigna -1 al último elemento. La longitud está entre 1 y 10⁴, y los valores entre 1 y 10⁵.

Given an array arr, replace every element with the greatest element to its right, and set the last element to -1. The length ranges from 1 to 10⁴, and values are between 1 and 10⁵. */

/// Original solution. Time complexity: O(n), Space complexity: O(n). Beats 100% & 43%
func replaceElements(_ arr: [Int]) -> [Int] {
    let n = arr.count
    var max = arr.last!
    var result = Array(repeating: 0, count: n)
    result[n-1] = -1
    for index in (0..<n-1).reversed() {
        result[index] = max
        if arr[index] > max { max = arr[index] }
    }
    return result
}

/// Test cases
replaceElements([17, 18, 5, 4, 6, 1]) // Expected: 18, 6, 6, 6, 1, -1]
replaceElements([1001, 1002, 1003, 1004, 1000]) // Expected: [1004, 1004, 1004, 1000, -1]
replaceElements([1,42,56,34,24,78,32,13,56,21,34,31,56,78,43,13,56,2,1,23,56,63,14,56,24,14,31,2,5,84,3,1,35,7,8,9,3,2,1]) // Expected: [84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 35, 35, 35, 9, 9, 9, 3, 2, 1, -1]
