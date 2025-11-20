/* PROBLEMA FIZZ-BUZZ
 Dado un entero n, genera un arreglo de cadenas 1-indexado de tamaño n donde para cada i de 1 a n pones "FizzBuzz" si i es divisible por 3 y 5, "Fizz" si solo por 3, "Buzz" si solo por 5, y la representación en cadena de i en otro caso. Devuelve ese arreglo en orden. Ejemplo: n = 5 → ["1","2","Fizz","4","Buzz"]. Restricción: 1 ≤ n ≤ 10^4.

 Given an integer n, produce a 1-indexed string array of length n where for each i from 1 to n you put "FizzBuzz" if i is divisible by both 3 and 5, "Fizz" if only by 3, "Buzz" if only by 5, otherwise the string form of i. Return the array in order. Example: n = 5 → ["1","2","Fizz","4","Buzz"]. Constraint: 1 ≤ n ≤ 10^4. */


/// Solución original
func fizzBuzz(_ n: Int) -> [String] {
    var answer = [String]()
    for num in 1...n {
        if num % 15 == 0 { answer.append("FizzBuzz") } // Si hay un nuevo "if" adentro del else de un "if", debemos usar "else if".
        else if num % 5 == 0 { answer.append("Buzz") }
        else if num % 3 == 0 { answer.append("Fizz") }
        else { answer.append(String(num)) }
    }
    return answer
}

/// Casos de prueba:
print(fizzBuzz(3))
print(fizzBuzz(5))
print(fizzBuzz(15))


/// Solución con switch y casos booleanos
func fizzBuzz2(_ n: Int) -> [String] {
    var answer = [String]()
    for num in 1...n {
        switch (num.isMultiple(of: 3), num.isMultiple(of: 5)) {
        case (true, true):
            answer.append("FizzBuzz")
        case (false, true):
            answer.append("Buzz")
        case (true, false):
            answer.append("Fizz")
        default:
            answer.append(String(num))
        }
    }
    return answer
}

// Casos de prueba:
print(fizzBuzz2(3))
print(fizzBuzz2(5))
print(fizzBuzz2(15))
