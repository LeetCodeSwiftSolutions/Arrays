/* TRIÁNGULO DE PASCAL
Dado un entero numRows, genera las primeras numRows filas del Triángulo de Pascal, donde cada número es la suma de los dos números directamente arriba de él. El número de filas debe estar entre 1 y 30.
 
Given an integer numRows, return the first numRows of Pascal's triangle, where each number is the sum of the two numbers directly above it. The number of rows must be between 1 and 30. */

/// Solución original
func generate(_ numRows: Int) -> [[Int]] {
    // Validamos los casos iniciales
    guard numRows != 1 else { return [[1]] }
    guard numRows != 2 else { return [[1], [1, 1]] }
    // Variables para almacenar el resultado
    var result: [[Int]] = [[1], [1, 1]]
    var aux = [Int]()
    // Este ciclo maneja una fila completa del triángulo de Pascal
    for row in 3...numRows {
        for i in 0...result[row-2].count {
            // Para el primer y último elemento del nuevo renglón, agregamos un 1
            if i == 0 || i == result[row-2].count {
                aux.append(1)
            } else {
                // Para los términos de en medio, agregamos la suma de los 2 de arriba.
                aux.append(result[row-2][i] + result[row-2][i-1])
            }
        }
        // Anexamos el nuevo renglón
        result.append(aux)
        aux = []
    }
    return result
}

/// Pruebas
print(generate(10))
