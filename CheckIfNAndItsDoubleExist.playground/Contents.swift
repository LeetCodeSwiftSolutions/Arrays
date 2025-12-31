/* COMPRUEBE SI N Y SU DOBLE EXISTEN EN UN ARREGLO.
Dado un arreglo de enteros, verifica si existen dos índices distintos i y j tales que arr[i] sea el doble de arr[j]. La longitud del arreglo está entre 2 y 500, y los valores están entre -10³ y 10³

Given an integer array, check if there exist two distinct indices i and j such that arr[i] is twice arr[j]. The array length ranges from 2 to 500, with values between -10³ and 10³ */

/// Solución original: Time Complexity: O(nlogn). Space Complexity: O(n). Beats 7% & 13%
func checkIfExist(_ arr: [Int]) -> Bool {
    var currentNum = 0
    var sortedArr = arr.sorted()
    let n = sortedArr.count
    for i in 0 ..< n-1 {
        let currentNum = sortedArr[i]
        let hash: Set<Int> = currentNum > 0 ? Set(sortedArr[i+1..<n]) : Set(sortedArr[0..<i])
        if hash.contains(currentNum*2) { return true }
        if currentNum == 0, sortedArr[i+1] == 0 { return true }
    }
    return false
}

/// Pruebas
checkIfExist([1,2,3,4])     // Expected: true
checkIfExist([-1,-3,-4])    // Expected: false
checkIfExist([0,0])         // Expected: true
checkIfExist([0,1])         // Expected: false


/// Solución optimizada (de la comunidad de LeetCode). Time Complexity: O(n), Space complexity: O(n). Beats 100% & 13%
func checkIfExistOptimized(_ arr: [Int]) -> Bool {
    var seen = Set<Int>()
    for num in arr {
        if seen.contains(num*2) || (num % 2 == 0 && seen.contains(num/2)) { return true }
        seen.insert(num)
    }
    return false
}
