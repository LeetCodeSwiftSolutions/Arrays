/*
 Dado un arreglo nums, calcula su suma acumulada: para cada índice i, el valor es la suma de los elementos desde nums[0] hasta nums[i]. Devuelve un nuevo arreglo con esas sumas en el mismo orden. Ejemplo: [1,2,3,4] → [1,3,6,10]. Los números pueden ser negativos o positivos y la longitud del arreglo va de 1 a 1000.

 Given an array nums, compute its running sum: for each index i, the value equals the sum of the elements from nums[0] through nums[i]. Return a new array containing these sums in order. Example: [1,2,3,4] → [1,3,6,10]. Numbers may be negative or positive and the array length is between 1 and 1000.
 */

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


func runningSum2(_ nums: [Int]) -> [Int] {
    var nums = nums
    for index in 1..<nums.count {
        nums[index] = nums[index-1] + nums[index]
    }
    return nums
}

// Casos de prueba para la 2da solución
print(runningSum2([5]))
print(runningSum2([2,2,2,2,2]))
print(runningSum2([4,5,1,-10,9]))
