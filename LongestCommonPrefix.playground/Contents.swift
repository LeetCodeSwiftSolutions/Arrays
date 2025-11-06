/* Dado un arreglo de cadenas strs, encuentra y devuelve el prefijo común más largo compartido por todas. Compara desde el inicio de las palabras y detente cuando un carácter no coincida o una palabra termine. Si no existe ningún prefijo común, devuelve la cadena vacía "". Se garantiza que 1 <= strs.length <= 200, cada cadena tiene longitud 0..200, y si no está vacía solo usa letras minúsculas.

 Given an array of strings strs, find and return the longest common prefix shared by all of them. Compare from the start of the words and stop when a character differs or a word ends. If there is no common prefix, return the empty string "". Constraints: 1 <= strs.length <= 200, each string length is 0..200, and if non-empty it contains only lowercase letters. */

/// Solución original
func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    guard let firstWord = strs.first else {
        return ""
    }
    var index = firstWord.startIndex
    var aux = false // Nos servirá para terminar el proceso si no se encuentra alguna letra en todas las cadenas.
    
    for i in 0..<firstWord.count {
        for word in strs {
            if i < word.count {  // Nos aseguramos que exista una letra en "index" para todas las cadenas
                if firstWord[index] == word[index] {
                    continue // No necesitamos hacer nada si la letra se repite en la cadena siguiente, solo continuar.
                } else {
                    aux = true
                    break
                }
            } else {
                aux = true
            }
        }
        if aux { // Verificamos si alguna vez la letra no estuvo repetida en todas las cadenas.
            break
        } else {
            result.append(firstWord[index]) // Agregamos la letra que se encontró en todas las cadenas.
            index = firstWord.index(after: index) // Modificamos el index de comparación manualmente por ser una cadena.
        }
    }
    
    return result
}

longestCommonPrefix(["ab", "a"])


/// Análisis
// Tenemos un arreglo de cadenas.
// Necesitamos comparar los primeros caracteres de cada elemento del arreglo, con todos los demás.
// Si hay un prefijo que coincida en todas las cadenas, debemos regresarlo como respuesta.
// Si no hay ningún prefijo en común, regresamos la cadena vacía.
// Usaremos una variable llamada "prefijo" que inicializaremos como una cadena vacía.
// Solo modificaremos "prefijo" si encontramos una letra que coíncida en todas las cadenas.
// Podemos ir letra por letra, empezando desde el primer elemento y detenernos en cuanto esa letra no se encuentre en todas las cadenas.
// ME faltó evitar que revisara las cadenas más chicas que la primera.
