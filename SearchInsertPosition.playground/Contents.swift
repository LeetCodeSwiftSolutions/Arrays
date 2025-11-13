/* BÚSQUEDA DE ÍNDICE PARA INSERTAR ELEMENTO EN ARREGLO ORDENADO
Dado un arreglo ordenado ascendente de enteros distintos nums y un target, devuelve el índice si target está presente; si no, devuelve el índice donde debería insertarse para mantener el orden. Debe resolverse en O(log n) (búsqueda binaria). Restricciones: 1 <= nums.length <= 10^4, valores en [-10^4, 10^4] para nums[i] y target.

Given a sorted ascending array of distinct integers nums and a target value, return the index if target is found; otherwise return the index where it should be inserted to keep the order. The solution must run in O(log n) (binary search). Constraints: 1 <= nums.length <= 10^4, values in [-10^4, 10^4] for nums[i] and target. */


/// Solución original
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    // Definimos las variables de la búsqueda binaria
    var leftIndex = 0
    var rightIndex = nums.count - 1
    var middleIndex = 0
    // Algoritmo de búsqueda binaria
    while leftIndex <= rightIndex {
        middleIndex = (leftIndex + rightIndex)/2
        if nums[middleIndex] == target {
            return middleIndex
        }
        if nums[middleIndex] > target {
            if middleIndex - 1 < leftIndex {
                return middleIndex
            } else {
                rightIndex = middleIndex - 1
            }
        } else {
            if middleIndex + 1 > rightIndex {
                return middleIndex + 1
            } else {
                leftIndex = middleIndex + 1
            }
        }
    }
    // Adicional... si todos los índices son iguales, pero no se encontró target...
    return 0
}


/// Pruebas
searchInsert([1,3,5,6], 5)
searchInsert([1,3,5,6], 2)
searchInsert([1,3,5,6], 7)
searchInsert([1,3,5,6], 0)
searchInsert([1,3,5,6], 1)
searchInsert([1,3,5,6], 4)
searchInsert([1,3,5,6], 3)
