/* DUPLICACIÓN DE CEROS
Dado un arreglo de enteros de longitud fija, duplica cada aparición de cero desplazando los elementos restantes a la derecha, descartando los que excedan la longitud original. Modifica el arreglo in situ sin retornar nada. La longitud del arreglo está entre 1 y 10^4, y sus valores entre 0 y 9.

Given a fixed-length integer array, duplicate each occurrence of zero by shifting remaining elements to the right, discarding any elements beyond the original length. Modify the array in-place without returning anything. The array length ranges from 1 to 10^4, with values between 0 and 9. */

/// Solución original. Time complexity: O(n^2), Space complexity: O(1). Beats 5% and 75%
func duplicateZeros(_ arr: inout [Int]) {
    var subArr = [Int]()
    var i = 0
    while i < arr.count {
        if arr[i] == 0 && i+1<arr.count {
            subArr = arr[i+1..<arr.count].dropLast()
            arr[i+1] = 0
            arr.replaceSubrange(i+2..<arr.count, with: subArr)
            i += 2
        } else { i += 1 }
    }
}


/// Pruebas
var arr0 = [8, 4, 5, 0, 0, 7, 5, 1, 0, 1, 0]
duplicateZeros(&arr0) // Expected: [8, 4, 5, 0, 0, 0, 0, 7, 5, 1, 0]

var arr1 = [1, 0, 2, 3, 0, 4, 5, 0]
duplicateZeros(&arr1) // Expected: [1, 0, 0, 2, 3, 0, 0, 4]

var arr2 = [0, 0, 0, 0, 0, 0, 0]
duplicateZeros(&arr2) // Expected: [0, 0, 0, 0, 0, 0, 0]
