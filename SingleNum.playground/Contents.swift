/* BÚSQUEDA DEL NÚMERO NO REPETIDO
En un arreglo no vacío donde cada elemento aparece exactamente dos veces excepto uno que aparece solo una vez, encuentra ese elemento único. La solución debe tener complejidad temporal lineal y usar espacio extra constante.

In a non-empty array where every element appears exactly twice except for one element that appears only once, find that single element. The solution must have linear runtime complexity and use only constant extra space. */

/// Solución original
func singleNumber(_ nums: [Int]) -> Int {
    // Separamos el caso donde solo hay un elemento
    guard nums.count != 1 else { return nums.first! }
    // Ordenamos el arreglo y creamos una variable para almacenar el resultado
    var sortedNums = nums.sorted()
    var singleNum: Int?
    
    // También debemos analizar el caso de que sean 3 por separado
    guard sortedNums.count > 3 else {
        if sortedNums[0] != sortedNums[1] {
            return sortedNums[0]
        } else {
            return sortedNums[2]
        }
    }
    
    // Usamos stride(from: , through: by: ) para el ciclo for personalizado
    for i in stride(from: 0, through: sortedNums.count-3, by: 2) {
        if sortedNums[i] != sortedNums[i+1] {
            singleNum = sortedNums[i]
            break
        }
    }
    
    if singleNum == nil { singleNum = sortedNums.last }
    
    return singleNum!
}

/// Pruebas
singleNumber([1,1,2,3,4,5,4,5,3,-1,2])


/// Solución optimizada
func singleNumberOptimized(_ nums: [Int]) -> Int {
    nums.reduce(0) {
        // Usamos el operador XOR para comparar todos los números
        $0 ^ $1
    }
}

/*
 // Ejemplo de uso de reduce:
 reduce(1) { (acumulador, elementoActual) in
     return acumulador + elementoActual
 }
 // que es equivalente a:
 reduce(1) { $0 + $1 }
 
 // Operador XOR
 a ^ a = 0 (cualquier número XOR consigo mismo da 0)

 a ^ 0 = a (cualquier número XOR con 0 da el mismo número)

 a ^ b ^ a = b (propiedad conmutativa y asociativa)
 */
