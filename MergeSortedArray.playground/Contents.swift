/* FUSIONAR DOS ARREGLOS ORDENADOS.
Se deben combinar dos arreglos enteros ordenados, nums1 y nums2, usando solo sus primeros m y n elementos respectivamente, para producir un único arreglo ordenado almacenado directamente en nums1, que tiene espacio total m + n. Los elementos sobrantes de nums1 (inicialmente ceros) no deben considerarse. El objetivo es mezclar ambos arreglos en orden no decreciente en O(m + n).

You must merge two sorted integer arrays, nums1 and nums2, using only their first m and n elements respectively, producing a single sorted array stored directly in nums1, which has total space m + n. The trailing zeros in nums1 should be ignored. The goal is to merge both arrays in non-decreasing order in O(m + n) time. */

///
/// Solución original
///
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // Si nums1 no contiene elementos propios, lo cambiamos por nums2
    guard m != 0 else { nums1 = nums2; return }
    // Si nums2 no contiene elementos, no hay nada que hacer
    guard n != 0 else { return }
    
    // Agregamos todos los elementos de nums2 a nums1
    for i in m..<m+n {
        nums1[i] = nums2[i-m]
    }
    
    // Ordenamos nuevamente nums1
    nums1 = nums1.sorted()
}

///
/// Pruebas de solución original
///

var nums1: [Int] = [1,2,3,17,21,45,93,0,0,0,0,0]
var nums2: [Int] = [-89,-17,19,58,77]
merge(&nums1, 7, nums2, 5)


///
/// Solución optimizada
///
func optimizedMerge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1        // Último elemento válido en nums1
    var j = n - 1        // Último elemento en nums2
    var k = m + n - 1    // Posición para escribir en nums1

    // Mientras queden elementos en nums2
    while j >= 0 {
        // Si el último elemento válido de nums1 es mayor que el de nums2, lo acomodamos en la posición k de nums1
        if i >= 0 && nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
        } else {
            // Si no, acomodamos el último elemento válido de nums2 en la posición k de nums1.
            nums1[k] = nums2[j]
            j -= 1
        }
        // Recorremos la posición para insertar en nums1.
        k -= 1
    }
    // Si j < 0, los elementos restantes de nums1 ya están en su lugar.
}

///
/// Pruebas de solución optimizada
///

var n1: [Int] = [1,2,3,0,0,0]
let n2: [Int] = [2,5,6]
optimizedMerge(&n1, 3, n2, 3)
