/* SUMA ACUMULADA DE UN ARREGLO.
 Dado un arreglo nums, calcula su suma acumulada: para cada índice i, el valor es la suma de los elementos desde nums[0] hasta nums[i]. Devuelve un nuevo arreglo con esas sumas en el mismo orden. Ejemplo: [1,2,3,4] → [1,3,6,10]. Los números pueden ser negativos o positivos y la longitud del arreglo va de 1 a 1000.

 Given an array nums, compute its running sum: for each index i, the value equals the sum of the elements from nums[0] through nums[i]. Return a new array containing these sums in order. Example: [1,2,3,4] → [1,3,6,10]. Numbers may be negative or positive and the array length is between 1 and 1000.
 */

/// Solución original
func runningSum(_ nums: [Int]) -> [Int] {
    // Si el arreglo solo tiene un elemento, no es necesario realizar ningún cálculo.
    guard nums.count > 1 else { return nums }
    // Creamos las variables necesarias
    var result = [Int]()
    var sum = 0
    // Iteramos sobre el arreglo
    for num in nums {
        sum += num
        result.append(sum)
    }
    // Retornamos el arreglo final
    return result
}

// Casos de prueba
print(runningSum([1,2,3,4]))
print(runningSum([1,1,1,1,1]))
print(runningSum([3,1,2,10,1]))


/// Solución optimizada, de la comunidad
func runningSum2(_ nums: [Int]) -> [Int] {
    var nums = nums // Swift no permite modificar el parámetro de entrada
    for i in 1..<nums.count {
        nums[i] += nums[i-1]
    }
    return nums
}

// Casos de prueba para la solución optimizada
print(runningSum2([5]))
print(runningSum2([2,2,2,2,2]))
print(runningSum2([4,5,1,-10,9]))


/// Solución adicional (original)
func runningSum3(_ nums: [Int]) -> [Int] {
    var runningSumArray = nums
    for i in 0..<nums.count {
        runningSumArray[i] = nums[0...i].reduce(0, +)
    }
    return runningSumArray
}

// Casos de prueba para la solución adicional
print(runningSum3([3,1,2,10,1]))
print(runningSum3([2,2,2,2,2]))
print(runningSum3(([4,5,1,-10,9])))
