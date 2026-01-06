/* PERMUTACIONES
Dado un arreglo de enteros distintos, devuelve todas las permutaciones posibles de sus elementos. La longitud está entre 1 y 6, y los valores entre -10 y 10.

Given an array of distinct integers, return all possible permutations of its elements. The length ranges from 1 to 6, and values are between -10 and 10. */

/// Solución semi original, implementada con ayuda de NeetCode.
func permute(_ nums: [Int]) -> [[Int]] {
    // Caso base, retorna arreglo vacío
    if nums.isEmpty { return [[]] }
    
    // Llama recursivamente hasta mandar un arreglo vacío, porque el arreglo vacío ya no llega aquí, retorna [[]]
    let permutations = permute(Array(nums[1...]))
    
    // Creamos un arreglo para almacenar los resultados
    var result = [[Int]]()
    
    // Aquí ya tenemos una respuesta de la función permute que varía por nivel (el nivel n (más alto) tiene [[]] y el nivel 1 tiene todas las permutaciones de los elementos 1..<nums.count del arreglo original)
    for permutation in permutations {
        for i in 0...permutation.count {
            // Usamos aux para insertar el primer valor de nums actual en todas las posiciones de cada permutación
            var aux = permutation
            aux.insert(nums[0], at: i)
            result.append(aux)
        }
    }
    
    return result
}


/// Test case
print(permute([1, 2, 3, 4])) // Expected: [[1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1], [1, 3, 2, 4], [3, 1, 2, 4], [3, 2, 1, 4], [3, 2, 4, 1], [1, 3, 4, 2], [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1], [1, 2, 4, 3], [2, 1, 4, 3], [2, 4, 1, 3], [2, 4, 3, 1], [1, 4, 2, 3], [4, 1, 2, 3], [4, 2, 1, 3], [4, 2, 3, 1], [1, 4, 3, 2], [4, 1, 3, 2], [4, 3, 1, 2], [4, 3, 2, 1]]


/* Diagrama de inserción visual, ejemplo de 3 elementos:
 
 Nivel 3: Aquí nums = [3]
    Obtuvimos: permutations = [] -> Insertamos 3 en todas las posiciones:
    Regresamos:
        [3] como único resultado.

 Nivel 2: Aquí nums = [2,3]
    Obtuvimos permutations = [3] → Insertamos 2 en todas las posiciones:
    Regresamos:
        Pos 0: [2,3]
        Pos 1: [3,2]

 Nivel 1: Aquí nums = [1, 2, 3]
    Obtuvimos permutations = [[2,3], [3,2]] → Insertamos 1 en todas las posiciones:
        Para [2,3] regresamos:
            Pos 0: [1,2,3]  ← Inserta 1 al inicio
            Pos 1: [2,1,3]  ← Inserta 1 en medio
            Pos 2: [2,3,1]  ← Inserta 1 al final
        Para [3,2] regresamos:
            Pos 0: [1,3,2]
            Pos 1: [3,1,2]
            Pos 2: [3,2,1]
 */

