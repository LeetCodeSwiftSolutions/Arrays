/* TERCER NÚMERO DISTINTO MÁS GRANDE
Dado un arreglo de enteros, devuelve el tercer valor máximo distinto. Si no existe, devuelve el valor máximo. La longitud está entre 1 y 10⁴, y los valores están en el rango de enteros de 32 bits con signo.

Given an integer array, return the third distinct maximum value. If it does not exist, return the maximum value. The length ranges from 1 to 10⁴, and values are in the 32-bit signed integer range. */

/// Original solution. Time Complexity: O(n log n), Space Complexity: O(n). Beats 100% & 98%
func thirdMax(_ nums: [Int]) -> Int {
    guard nums.count >= 3 else { return nums.max()! }
    let sortedNums = nums.sorted()
    var currentNum = sortedNums.last!
    var pos = 1
    var i = sortedNums.count-2
    while i >= 0 && pos < 3 {
        if currentNum != sortedNums[i] {
            currentNum = sortedNums[i]
            pos += 1
        }
        i -= 1
    }
    return pos == 3 ? currentNum : sortedNums.last!
}

/// Test cases
thirdMax([-30, 55]) // Expected: 55
thirdMax([13, 21, 24, 25, 25, 24]) // Expected: 21
thirdMax([-45, -65, -65, -12, -10, -25]) // Expected: -25

