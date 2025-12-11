/* NÚMERO FALTANTE
Dado un arreglo de n números distintos en el rango [0, n], encuentra el único número que falta en ese rango. El arreglo tiene entre 1 y 10⁴ elementos, todos únicos y dentro de los límites.

Given an array of n distinct numbers in the range [0, n], find the only number missing from that range. The array contains 1 to 10⁴ elements, all unique and within the limits. */

/// Solución original
func missingNumber(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    var low = 0
    var high = sortedNums.count - 1
    var missingNum = 0
    // Consideramos los casos límite
    if let firstNumber = sortedNums.first, firstNumber != 0 { return 0 }
    if let lastNumber = sortedNums.last, lastNumber != nums.count { return nums.count }
    // Tengo garantizado que el primer elemento es cero y el último elemento es n
    while low < high {
        if sortedNums[low] + 1 != sortedNums[low+1] { missingNum = sortedNums[low] + 1 }
        if sortedNums[high] - 1 != sortedNums[high-1] { missingNum = sortedNums[high] - 1 }
        low += 1
        high -= 1
    }
    return missingNum
}

/// Pruebas
print(missingNumber([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 19, 18, 17, 16, 15, 14, 13, 12, 20]))
print(missingNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
print(missingNumber([0]))
