/* TRIÁNGULO DE PASCAL
Dado un índice rowIndex (0-indexado), genera la fila correspondiente del Triángulo de Pascal, donde cada número es la suma de los dos directamente arriba. El índice está entre 0 y 33.

Given a 0-indexed rowIndex, generate the corresponding row of Pascal's Triangle, where each number is the sum of the two numbers directly above it. The index ranges from 0 to 33. */

/// Solución original -> Runtime (time complexity): O(rowindex^2), Memory (space complexity): O(rowIndex)
func getRow(_ rowIndex: Int) -> [Int] {
    // Manejamos los casos límite
    guard rowIndex != 0 else { return [1] }
    guard rowIndex != 1 else { return [1, 1] }
    // Variables para almacenar el resultado y calcular nuevas filas
    var currentRow = [Int]()
    var lastRow = [1, 1]
    // Repetimos el algoritmo para el número de filas que nos piden.
    for i in 2...rowIndex {
        // Aquí manejamos la lógica para obtener una nueva fila en cada ciclo
        for j in 0...i {
            if j == 0 || j == i { currentRow.append(1) } else {
                currentRow.append(lastRow[j-1] + lastRow[j])
            }
        }
        // Actualizamos lastRow y reiniciamos currentRow
        lastRow = currentRow
        currentRow = []
    }
    return lastRow
}


/// Pruebas
getRow(3)   // Expected: [1, 3, 3, 1]
getRow(5)   // Expected: [1, 5, 10, 10, 5, 1]
getRow(10)  // Expected: [1, 10, 45, 120, 210, 252, 210, 120, 45, 10, 1]
