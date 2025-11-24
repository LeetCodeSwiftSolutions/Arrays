/* SUMA MÁXIMA DIVISIBLE ENTRE TRES
 Dado un arreglo de enteros, se debe obtener la suma máxima posible de sus elementos que sea divisible entre tres, eligiendo libremente cualquier subconjunto. Si ningún subconjunto cumple la condición, la suma resultante es cero.

 Given an integer array, return the maximum possible sum of its elements that is divisible by three, selecting any subset of numbers. If no subset satisfies the condition, the resulting sum is zero. */

import Foundation

/// Solución original
func maxSumDivThree(_ nums: [Int]) -> Int {
    // Arreglos necesarios para acomodar los datos y cubrir casos límite
    var sortedNums = nums.sorted()
    var moduleNums = sortedNums.map {$0 % 3}
    let moduleSum = moduleNums.reduce(0, +)

    // Consideramos casos en donde no exista suma que sea divisible entre 3
    guard moduleNums.contains(0) || moduleSum >= 3 else { return 0 }

    // Variables auxiliares para el cálculo de la suma
    var totalSum = nums.reduce(0, +)
    var auxSum = 0
    var auxArray = [Int]()

    // Hay 3 casos posibles para el módulo de la suma de módulos
    switch moduleSum % 3 {
        // Si el módulo vuelve a dar cero, la suma total es divisible entre 3
        case 0: return totalSum
        // Si el módulo da 1, la suma total se pasa por 1, para ser divisible entre 3.
        case 1:
        if moduleNums.contains(1) {
            let index = moduleNums.firstIndex(of: 1)!
            auxArray.append(sortedNums[index])
        }
        if moduleNums.filter({ $0 == 2 }).count >= 2 {
            let firstIndexOf2 = moduleNums.firstIndex(of: 2)!
            let secondIndexOf2 = moduleNums.suffix(from: moduleNums.index(after: firstIndexOf2)).firstIndex(of: 2)!
            auxSum = sortedNums[firstIndexOf2] + sortedNums[secondIndexOf2]
            auxArray.append(auxSum)
        }
        // Solo tenemos que restarle el menor de los números encontrados, que hacían que la suma no fuera divisible
        return totalSum - (auxArray.min() ?? 0)
        // Si el módulo da 2, la suma total se pasa por 2, para ser divisible entre 3
        case 2:
        if moduleNums.contains(2) {
            let index = moduleNums.firstIndex(of: 2)!
            auxArray.append(sortedNums[index])
        }
        if moduleNums.filter({ $0 == 1 }).count >= 2 {
            let firstIndexOf1 = moduleNums.firstIndex(of: 1)!
            let secondIndexOf1 = moduleNums.suffix(from: moduleNums.index(after: firstIndexOf1)).firstIndex(of: 1)!
            auxSum = sortedNums[firstIndexOf1] + sortedNums[secondIndexOf1]
            auxArray.append(auxSum)
        }
        return totalSum - (auxArray.min() ?? 0)
        default: return 0
    }
}

/// Pruebas
print(maxSumDivThree([0, 1, 2, 7, 2, 5, 11, 21, 4]))
print(maxSumDivThree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
print(maxSumDivThree([4,1,5,3,1]))
