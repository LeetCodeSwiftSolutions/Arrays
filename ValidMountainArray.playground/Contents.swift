/* Arreglo montañoso válido.
Dado un arreglo de enteros, determina si es un "arreglo montaña": longitud >= 3, existe un índice i tal que los elementos estrictamente aumentan hasta i y luego estrictamente disminuyen. La longitud está entre 1 y 10^4, y los valores entre 0 y 10^4.

Given an integer array, determine if it is a "mountain array": length >= 3, there exists an index i such that elements strictly increase up to i and then strictly decrease. The length ranges from 1 to 10^4, with values between 0 and 10^4. */

/// Solución original: Time Complexity: O(n), Space Complexity: O(1). Beats 60% & 78%
func validMountainArray(_ arr: [Int]) -> Bool {
    // Manejamos los casos extremos
    guard arr.count >= 3 else { return false }
    // Comienza con pendiente negativa
    guard arr[0] < arr[1] else { return false }
    var currentNum = 0
    var isIncreasing = true
    for index in 0..<arr.count-1 {
        currentNum = arr[index]
        // Cerramos casos de pendientes planas
        if currentNum == arr[index+1] { return false }
        // Inicio de montaña (pendiente positiva) y cambio de pendiente
        if currentNum < arr[index+1] && isIncreasing { continue }
        else if currentNum > arr[index+1] && isIncreasing {
            isIncreasing = false
            continue
        }
        // Camino con pendiente negativa
        if !isIncreasing && currentNum > arr[index+1] { continue }
        else { return false}
    }
    return !isIncreasing
}

/// Pruebas
validMountainArray([2,0,2]) // Expected: false
validMountainArray([0,1,2,4,2,1])  // Expected: true
validMountainArray([0,1,2,3,4,5,6,7,8,9])  // Expected: false
validMountainArray([9,8,7,6,5,4,3,2,1,0])  // Expected: false
validMountainArray([14,82,89,84,79,70,70,68,67,66,63,60,58,54,44,43,32,28,26,25,22,15,13,12,10,8,7,5,4,3])  // Expected: false


