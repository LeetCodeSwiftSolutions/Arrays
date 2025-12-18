/* BÚSQUEDA EN UNA MATRIZ 2D
Dada una matriz de m x n ordenada de forma que cada fila es no decreciente y el primer entero de cada fila es mayor que el último entero de la fila anterior, determina si el valor target está presente en la matriz. La solución debe tener complejidad O(log(m * n)). Las dimensiones están entre 1 y 100, y los valores entre -10⁴ y 10⁴.

Given an m x n matrix where each row is sorted in non-decreasing order and the first integer of each row is greater than the last integer of the previous row, determine if the target value is present in the matrix. The solution must have O(log(m * n)) time complexity. Dimensions range from 1 to 100, and values are between -10⁴ and 10⁴. */

/// Solución original. Time Complexity: O(log(m*n)), Space Complexity: O(1) --> Beats 100% & 93%
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    // Aplicamos búsqueda binaria para encontrar la fila.
    let n = matrix[0].count - 1
    var minorIndex = 0
    var middleIndex = 0
    var majorIndex = matrix.count - 1
    // Buscamos el índice de la fila en donde debería encontrarse target...
    while minorIndex <= majorIndex {
        middleIndex = (minorIndex+majorIndex)/2
        if target >= matrix[middleIndex][0] && target <= matrix[middleIndex][n] { break }
        if target < matrix[middleIndex][0] { majorIndex = middleIndex - 1 }
        if target > matrix[middleIndex][n] { minorIndex = middleIndex + 1 }
    }
    // Ya tenemos el índice buscado en "middleIndex"
    let searchIndex = middleIndex
    minorIndex = 0
    majorIndex = n
    // 2do algoritmo de búsqueda binaria
    while minorIndex <= majorIndex {
        middleIndex = (minorIndex+majorIndex)/2
        if target == matrix[searchIndex][middleIndex] { return true }
        if target < matrix[searchIndex][middleIndex] { majorIndex = middleIndex - 1 }
        if target > matrix[searchIndex][middleIndex] { minorIndex = middleIndex + 1 }
    }
    // Si salimos del último while sin retornar nada, es porque no se encontró el target
    return false
}

/// Pruebas
searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 1)    // Expected: true
searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 9)    // Expected: false
searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 11)   // Expected: true
searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 24)   // Expected: false
searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 60)   // Expected: true
