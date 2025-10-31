/* BUSQUEDA DE ÍNDICES DE UN ARREGLO PARA UNA SUMA = TARGET.
 Dado un arreglo de enteros nums y un entero target, encuentra los índices de los dos elementos cuya suma sea target. Existe exactamente una solución y no puedes usar el mismo elemento dos veces. Devuelve los índices en cualquier orden. Ejemplo: nums = [2,7,11,15], target = 9 → [0,1]. Restricciones: 2 ≤ nums.length ≤ 10^4, −10^9 ≤ nums[i] ≤ 10^9, −10^9 ≤ target ≤ 10^9, solo hay una respuesta válida.
 Given an integer array nums and an integer target, find the indices of the two numbers whose sum equals target. Exactly one solution exists and you may not use the same element twice. Return the indices in any order. Example: nums = [2,7,11,15], target = 9 → [0,1]. Constraints: 2 ≤ nums.length ≤ 10^4, −10^9 ≤ nums[i] ≤ 10^9, −10^9 ≤ target ≤ 10^9, only one valid answer. */

/// Solución inicial (original)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    // Creamos un arreglo que tenga el valor que le falta a cada número para llegar al target (en signo opuesto)
    let aux = nums.map{$0-target}
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            // Analizamos si el número que le hace falta para llegar al target (con signo opuesto), es alguno del arreglo.
            if i != j && -1*(aux[i]) == nums[j] {
                return [i, j]
            }
        }
    }
    return []
}

print(twoSum([2,7,11,15], 9))

/// Solución optimizada.
func twoSumOptimized(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()  // Diccionario que almacena en el orden: [key (number): value (index)]
    // nums.enumerated = [(0, nums[0]), (1, nums[1]), ... ((n-1), nums[n-1])]
    for (i, num) in nums.enumerated() {
        let complement = target - num // Se actualiza el complemento para cada número
        if let j = dict[complement] { // Si ya hay algo en el diccionario, se busca el complemento.
            return [j, i] // Se encuentra el valor
        }
        dict[num] = i // Si no se encuentra el valor, se agrega el par al diccionario.
    }
    return [] // No se encontró ningún par
}

print(twoSumOptimized([2,7,11,15], 9))
