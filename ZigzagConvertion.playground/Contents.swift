/* CONVERSIÓN EN ZIGZAG.
 Convierte la cadena s en un patrón zigzag de numRows filas escribiendo los caracteres secuencialmente: primero hacia abajo en columnas verticales hasta la última fila, luego en diagonal hacia arriba hasta la primera fila, repitiendo este proceso. Finalmente, lee todas las filas en orden de arriba a abajo y concaténalas para obtener la cadena resultante.
 Restricciones: 1 <= s.count <= 1000; 1 <= numRows <= 1000; s cotiene solamente letras mayúsculas y minúsculas "," y "."

 Convert the string s into a zigzag pattern with numRows rows by writing characters sequentially: first moving down in vertical columns to the bottom row, then moving diagonally upward to the top row, repeating this process. Finally, read all rows from top to bottom and concatenate them to form the output string.
Constaints: 1 <= s.count <= 1000; 1 <= numRows <= 1000; s consiste of English letters (lower-case and upper-case), "," y "." */

import Foundation

/// Solución original
func convert(_ s: String, _ numRows: Int) -> String {
    // Separamos los casos límite
    guard numRows > 1 else { return s }
    guard numRows < s.count else { return s }
    guard !s.isEmpty else { return "" }
    // Primero tenemos que construir una matriz que pueda almacenar a todos los caracteres
    var numCol = numRows == 2 ? s.count/2 + 1 : s.count / (numRows - 2) + 1
    var matrix: [[Character]] = Array(
        repeating: Array(repeating: Character(" "), count: numCol),
        count: numRows
    )
    // Variables adicionales necesarias
    var n = s.index(after: s.startIndex) // Índice de la cadena s
    var i = 0 // Valor fijo de la columna j para algunas iteraciones
    var j = 0

    // Seteamos el primer valor
    matrix[0][0] = s.first!
    
    // Creamos el patrón de zigzag en una matriz
    while n < s.endIndex {
        // Recorremos verticalmente hacia abajo
        for row in 1..<numRows {
            if n < s.endIndex {
                matrix[row][j] = s[n]
                n = s.index(after: n)
            } else { break }
        }
        
        // Seteamos valores
        i = numRows - 2
        j += 1
        
        // Recorremos hacia arriba (sin diagonal)
        while i >= 0 && n < s.endIndex {
            if n < s.endIndex {
                matrix[i][j] = s[n]
                n = s.index(after: n)
                i -= 1
                if i == 0 { j += 1 }
            } else { break }
        }
    }
    
    // Convertimos la matriz en una cadena sin espacios.
    var result: String = matrix.compactMap { String($0) }.joined()
    result = result.replacingOccurrences(of: " ", with: "")
    
    return result
}

/// Pruebas
print(convert("PAYPALISHIRING", 2))
print(convert("PAYPALISHIRING", 3))
print(convert("PAYPALISHIRING", 4))

let s = "hiklorxwaciwybmsfgwitrcytzmzlpvszhfnadlcfuadxmycvumqmrphqbgbsevsnbfqgtulnvrmhpoejcvxtmfjnnmgriahlfxrarenovzwkpcwsxtljaxzojhhthogonzpheevzetkvygpvbdhcaisjpbfwslmflbopgmqmfcjdkzbmckqeskpjluhditltvzkdlaptdyynzbbdlthfdzopvvudpfymhipslenqemfenhjbcrggsxxnsrtjxrveckypqofxckbrtkswdbexyblqsearxxxbiwqakvxoiafdnybszfqxibpdhrugpsizqyzcwzqgzvjovnhuuxtdalgjccpruzqkysmwrecsalhvaqsvnlynygybinufpnpnfejyinskybgzrywelutkctnkjhryujnbpwbxluklvqkpqivdcrpgkcttmkrgtekiclinfszdklscuphygzhrdampmeygkiqptacbudggraknpslwrupuubmhhkpsuhhnklqepwniwxvmpikidzdzargibxcvhjkrudvlzitwiqkxzugctlbtekdfjfcqqohnrfytpupxkzvltdnoqrjubnbkufdltkynpygfsxcfyzqreghuxqoadrmywpjscjfrhnyakdhiczbjfideaugelvekkpcmyjgfwghijqsoqtxxdacdwkjifpusgweefmmdtvlcmdqeypbdqfimqswvjqnqouwvgkybijguowyombrehasxurufjkvaeuvmguoofukuskkgmcmvehsyyodjybjcxfrdbfugbecvpnedrqyvxstxgyjf"
let n = 467
print(convert(s, n))

