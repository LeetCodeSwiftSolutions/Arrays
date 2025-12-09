/* INVERSIÓN DE ORDEN DE BITS DE UN ENTERO
Invierte el orden de los bits de un entero sin signo de 32 bits dado y retorna el resultado entero correspondiente. El valor de entrada está entre 0 y 2³¹-2 y es par.

Reverse the bit order of a given 32-bit unsigned integer and return the corresponding Int result. The input value ranges from 0 to 2³¹-2 and is even. */

/// Solución original
func reverseBits(_ n: Int) -> Int {
    var binary = String(n, radix: 2)

    if binary.count < 32 {
        let zerosNeeded = 32 - binary.count
        let zerosString = String(repeating: "0", count: zerosNeeded)
        binary = zerosString + binary
    }
    
    var array: [Character] = Array(binary)
    var low = 0
    var high = array.count - 1
    
    while low < high {
        array.swapAt(low, high)
        low += 1
        high -= 1
    }
    
    binary = String(array)
    if let result = Int(binary, radix: 2) {
        return result
    }
    
    return 0
}


/// Pruebas
print(reverseBits(10))
