/* PROMEDIO MÁXIMO DE SUBARREGLO I.
Dado un arreglo de enteros nums y un entero k, encuentra un subarreglo contiguo de longitud k con el promedio máximo y devuelve ese valor. Se acepta un error de cálculo menor a 10⁻⁵. La longitud n del arreglo está entre 1 y 10⁵, k entre 1 y n, y los elementos entre -10⁴ y 10⁴.

Given an integer array nums and an integer k, find a contiguous subarray of length k with the maximum average value and return that average. A calculation error less than 10⁻⁵ is acceptable. The length n of the array ranges from 1 to 10⁵, k from 1 to n, and elements are between -10⁴ and 10⁴. */

/// Solution optimized with Deepseek. Time complexity: O(n), Space complexity: O(1). Beats 100% & 43%
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    // Initialize the first window using the first k values
    var currentSum = nums[0..<k].reduce(0, +)
    var maxSum = currentSum
    // We iterate over the range [k, nums.count)
    for i in k ..< nums.count {
        // Add the new value from the right and subtract the value leaving the window (from the left)
        currentSum += nums[i] - nums[i-k]
        // Update the maximum sum
        maxSum = max(maxSum, currentSum)
    }
    // Calculate and return the average
    return Double(maxSum) / Double(k)
}

/// Test cases
findMaxAverage([1,12,-5,-6,50,3], 4) // Expected: 12.75
findMaxAverage([1,12,-5,-6,50,3], 2) // Expected: 26.5
findMaxAverage([1,12,-5,-6,50,3], 1) // Expected: 50


/* Ejemplo de solución NAIVE
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var avg = 0.0
        for i in 0 ... nums.count-k {
            let subArray = nums[i..<k+i]
            // INEFICIENTE, no usar porque resulta un O(n^2) por el reduce dentro del for...
            let sum = Double(subArray.reduce(0,+))
            avg = max(avg, sum/Double(k))
            print("subArray: , ", subArray, "sum: ", sum, "avg: ", avg)
        }
        return avg
    }
*/
