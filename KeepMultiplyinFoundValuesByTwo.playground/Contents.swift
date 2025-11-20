/* CONTINUAR MULTIPLICANDO UN VALOR ENCONTRADO EN UN ARREGLO POR DOS.
Se te da un arreglo de enteros **nums** y un entero **original**, que es el número inicial que debes buscar. Mientras **original** aparezca en **nums**, debes multiplicarlo por 2 y repetir el proceso con el nuevo valor. Si en algún momento **original** ya no aparece en el arreglo, el proceso termina y devuelves el valor final. Restricciones: 1 <= nums.length <= 1000, 1 <= nums[i], original <= 1000.

You are given an integer array **nums** and an integer **original**, which is the initial number to search for. While **original** is found in **nums**, you must multiply it by 2 and repeat the check with the new value. When **original** is no longer present in the array, the process stops, and you return the final value. Constraints: 1 <= nums.length <= 1000, 1 <= nums[i], original <= 1000. */


import Foundation

/// Solución original
func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
    // Creamos un diccionario para poder buscar de manera eficiente los valores que esperamos.
    var dictionary = [Int: Int]()
    let limit = Int.max / (original*2) // Límite para evitar overflow aritmético
    // Lo llenamos con el maximo número de valores coincidentes posibles.
    for n in 0...nums.count {
        if original * Int(pow(Double(2), Double(n))) < limit {
            dictionary[n] = original * Int(pow(Double(2), Double(n)))
        } else {
            break
        }
    }
    
    // Buscamos hasta qué número coincide el arreglo, cero no está dentro de los parámetros.
    var i = 0
    while nums.contains(dictionary[i] ?? 0) {
        i += 1
    }
    
    // Si nunca entrò al while, entonces "original" no se encontró en el arreglo
    return i == 0 ? original : dictionary[i] ?? 0
}


/// Pruebas
findFinalValue([1,2,4,8], 16)
findFinalValue([13, 8, 5, 10, 20, 40, 31, 83, 80, 113, 160, 134, 320, 130], 5)
findFinalValue([2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096], 2)
findFinalValue([170,104,505,972,262,847,283,349,346,783,624,690,645,211,873,295,702,765,313,521,489,311,391,412,521,386,205,539,411,435,865,918,577,961,296,417,561,222,538,769,436,666,742,815,67,371,156,779,230,884,217,684,482,506,226,282,815,595,180,251,121,926,613,934,254,564,29,957,72,331,436,999,431,706,21,704,82,143,917,93,971,207,37,10,571,942,127,987,360], 666)
