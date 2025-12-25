/* ENCONTRAR NÚMEROS CON UNA CANTIDAD PAR DE DÍGITOS
Dado un arreglo de enteros positivos, cuenta cuántos números tienen una cantidad par de dígitos. La longitud del arreglo está entre 1 y 500, y cada número está entre 1 y 10⁵.

Given an array of positive integers, count how many numbers have an even number of digits. The array length ranges from 1 to 500, and each number is between 1 and 10⁵. */

/// Solución original. Time complexity: O(n). Beats 100% and 32%
func findNumbers(_ nums: [Int]) -> Int {
    var evenDigitNumbers = 0
    for num in nums {
        let stringNum = String(num)
        if stringNum.count % 2 == 0 { evenDigitNumbers += 1 }
    }
    return evenDigitNumbers
}


/// Pruebas
findNumbers([12, 345, 2, 6, 7890]) // Expected: 2
findNumbers([1000]) // Expected: 1
