/* SUMA 1 A UN ENTERO REPRESENTADO EN UN ARREGLO
Dado un arreglo digits que representa un entero sin ceros a la izquierda (más significativo primero), súmale 1 y devuelve el arreglo resultante. Maneja el acarreo: convierte los 9 finales en 0 y propaga hacia la izquierda; si todos son 9, antepone un 1 al inicio. Restricciones: 1 <= digits.length <= 100, cada dígito está en 0..9, sin ceros iniciales.

Given an array digits representing an integer with no leading zeros (most significant first), add 1 and return the resulting array. Handle carry: turn trailing 9s into 0 and propagate left; if all digits are 9, prepend a 1. Constraints: 1 <= digits.length <= 100, each digit in 0..9, no leading zeros. */


/// Solución optimizada (de la comunidad de LeetCode)
func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    
    // Usamos indices.reversed() para iterar del último elemento hasta el primero
    for index in digits.indices.reversed() {
        if digits[index] != 9 {
            digits[index] += 1
            return digits
        } else {
            digits[index] = 0
        }
    }
    
    // En caso de que siempre se haya ido al "else", nunca hizo el return
    digits.insert(1, at: 0)
    return digits
}

/// Pruebas
plusOne([7,2,8,5,0,9,1,2,9,5,7,2,8,5,0,9,1,2,9,5,7,2,8,5,0,9,1,2,9,5,7,2,8,5,0,9,1,2,9,5,7,2,8,5,0,9,1,2,9,5,0,0,0,9])


/// Solución original (sirve solo para enteros que no superen el valor máximo de Int <64 bits>)
func plusOneInt64(_ digits: [Int]) -> [Int] {
    // Convertimos el arreglo en un número tipo String, y lo casteamos a Int
    var num = Int(digits.map{"\($0)"}.joined(separator: "")) ?? 0
    print(num)
    // Hacemos la suma directa como Int
    num += 1
    
    // Creamos un nuevo arreglo vacío y le insertamos la cifra de las unidades
    var newArray = [Int]()
    newArray.append(num%10)
    
    // Iteramos sobre el número Int para ir insertando las demás cifras
    while num >= 10 {
        num /= 10
        newArray.insert(num%10, at: 0)
    }
    
    return newArray
}

/// Pruebas
plusOneInt64([7,2,8,5,0,9,1,2,9,5])
