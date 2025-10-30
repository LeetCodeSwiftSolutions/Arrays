/*
 Dada una matriz entera accounts de tamaño m×n, donde accounts[i][j] es el dinero que el cliente i tiene en el banco j, calcula la riqueza de cada cliente sumando los valores de su fila y devuelve la mayor de esas sumas. Ejemplo: [[1,5],[7,3],[3,5]] → 10 (la riqueza máxima). Restricciones: 1 ≤ m,n ≤ 50 y 1 ≤ accounts[i][j] ≤ 100.
 
 Given an m×n integer grid accounts, where accounts[i][j] is the money the i-th customer has in the j-th bank, compute each customer’s wealth as the sum of their row and return the maximum of these sums. Example: [[1,5],[7,3],[3,5]] → 10 (maximum row sum). Constraints: 1 ≤ m,n ≤ 50 and 1 ≤ accounts[i][j] ≤ 100.
 */

/// Primer solución (original)
func maximumWealth(_ accounts: [[Int]]) -> Int {
    var sums = [Int]()
    var sum = 0
    for i in 0..<accounts.count {
        sum = 0
        for j in 0..<accounts[i].count {
            sum += accounts[i][j]
        }
        sums.append(sum)
    }
    // Para obtener el valor máximo de un arreglo simplemente usamos el método .max()
    if let max = sums.max() { // O bien: sums.sorted().last
        return max
    } else {
        return 0
    }
}

// Casos de prueba
print(maximumWealth([[1,2,3],[3,2,1]])) // Expected: 6
print(maximumWealth([[1,5],[7,3],[3,5]])) // Expected: 10
print(maximumWealth([[2,8,7],[7,1,3],[1,9,5]])) // Expected: 17



/// Solución optimizada
/// El primer método (.map) transforma cada elemento del arreglo externo usando un closure. El segundo método (.reduce), combina todos los elementos de los arreglos internos, en uno solo, siguiendo el closure indicado.
func maximumWealthOptimized(_ accounts: [[Int]]) -> Int {
    accounts.map { $0.reduce(0, +) }.max() ?? 0 // El primer valor para el reduce es cero, y a partir de ese valor, se suman todos los demás elementos.
}

// Casos de prueba
print(maximumWealthOptimized([[1,2,3],[3,2,1]])) // Expected: 6
print(maximumWealthOptimized([[1,5],[7,3],[3,5]])) // Expected: 10
print(maximumWealthOptimized([[2,8,7],[7,1,3],[1,9,5]])) // Expected: 17
