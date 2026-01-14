/* MATRIZ ESPIRAL
Dada una matriz m x n, devuelve todos sus elementos en orden espiral (en sentido horario, empezando desde la esquina superior izquierda). Las dimensiones están entre 1 y 10, y los valores entre -100 y 100.

Given an m x n matrix, return all its elements in spiral order (clockwise, starting from the top-left corner). Dimensions range from 1 to 10, and values are between -100 and 100. */

/// Solución original: Beats: 100% & 44%
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = [Int]()
    var i = 0, j = 0
    // Límites superiores
    var iBottomLimit = matrix.count - 1
    var jRightLimit = matrix[0].count - 1
    // Límites inferiores
    var iTopLimit = 1
    var jLeftLimit = 0
    var isGoingUp = false
    while result.count < (matrix.count)*(matrix[0].count) {
        result.append(matrix[i][j])
        // Comenzamos (o continuamos) el movimiento a la derecha
        if (i < iTopLimit) && (j < jRightLimit) {
            j += 1
            continue
        }
        // Comenzamos el movimiento hacia abajo
        if (i < iBottomLimit) && (j == jRightLimit) && !isGoingUp {
            jRightLimit -= 1
            if i + 1 <= iBottomLimit { i += 1 }
            continue
        }
        // Continuamos el movimiento hacia abajo
        if (i < iBottomLimit) && (j > jRightLimit) && !isGoingUp {
            i += 1
            continue
        }
        // Comenzamos el movimiento a la izquierda
        if (i == iBottomLimit) && (j > jRightLimit) {
            iBottomLimit -= 1
            if j - 1 >= jLeftLimit { j -= 1 }
            continue
        }
        // Continuamos con el movimiento hacia la izquierda
        if (i >= iBottomLimit) && (j > jLeftLimit) {
            j -= 1
            continue
        }
        // Comenzamos el movimiento hacia arriba
        if (i >= iBottomLimit) && (j == jLeftLimit) {
            jLeftLimit += 1
            if i - 1 >= iTopLimit { i -= 1}
            isGoingUp = true
            continue
        }
        // Continuamos con el movimiento hacia arriba
        if (i > iTopLimit) && (j < jLeftLimit) && isGoingUp {
            i -= 1
            continue
        }
        // Comenzamos el movimiento a la derecha
        if (i == iTopLimit) && (j < jLeftLimit) {
            iTopLimit += 1
            if j + 1 <= jRightLimit { j += 1 }
            isGoingUp = false
            continue
        }
    }
    return result
}

/// Pruebas
spiralOrder([[1,2,3], [4,5,6], [7,8,9]]) // Expected: [1, 2, 3, 6, 9, 8, 7, 4, 5]
spiralOrder([[1,2,3,4,5,6,7,8,9,10],[11,12,13,14,15,16,17,18,19,20]]) // Expected: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11]
spiralOrder([[1,11],[2,12],[3,13],[4,14],[5,15],[6,16],[7,17],[8,18],[9,19],[10,20]]) // Expected: [1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 9, 8, 7, 6, 5, 4, 3, 2]


