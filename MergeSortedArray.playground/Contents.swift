/* FUSIONAR DOS ARREGLOS ORDENADOS.
Se deben combinar dos arreglos enteros ordenados, nums1 y nums2, usando solo sus primeros m y n elementos respectivamente, para producir un único arreglo ordenado almacenado directamente en nums1, que tiene espacio total m + n. Los elementos sobrantes de nums1 (inicialmente ceros) no deben considerarse. El objetivo es mezclar ambos arreglos en orden no decreciente en O(m + n).

You must merge two sorted integer arrays, nums1 and nums2, using only their first m and n elements respectively, producing a single sorted array stored directly in nums1, which has total space m + n. The trailing zeros in nums1 should be ignored. The goal is to merge both arrays in non-decreasing order in O(m + n) time. */


/// Solución original
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // Si nums1 no contiene elementos propios, lo cambiamos por nums2
    guard m != 0 else { nums1 = nums2; return }
    // Si nums2 no contiene elementos, no hay nada que hacer
    guard n != 0 else { return }
    
    // Agregamos todos los elementos de nums2 a nums1
    for i in m..<m+n {
        nums1.insert(nums2[i-m], at: i)
    }
    
    // Eliminamos los ceros
    nums1 = nums1.dropLast(n)
    // Ordenamos nuevamente nums1
    nums1 = nums1.sorted()
}

///
/// Pruebas
///

var nums1: [Int] = [1,2,3,17,21,45,93,0,0,0,0,0]
var nums2: [Int] = [-89,-17,19,58,77]
merge(&nums1, 7, nums2, 5)

/*
 var nums1: [Int] = [1,2,3,0,0,0]
 var nums2: [Int] = [2,5,6]
 merge(&nums1, 3, nums2, 3)
 */

