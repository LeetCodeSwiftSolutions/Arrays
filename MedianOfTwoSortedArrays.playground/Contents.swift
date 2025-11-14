/* MEDIANA DE DOS ARREGLOS ORDENADOS
Dadas dos arreglos ordenados nums1 y nums2 de tamaños m y n, devuelve la mediana del conjunto al combinarlos, sin necesidad de fusionarlos explícitamente. Si el total de elementos es impar, la mediana es el valor central; si es par, es el promedio de los dos centrales. Debe resolverse en O(log(m+n)). Restricciones: 0 <= m,n <= 1000, 1 <= m+n <= 2000, y los valores están en [-10^6, 10^6].

Given two sorted arrays nums1 and nums2 of sizes m and n, return the median of the combined set without explicitly merging them. If the total count is odd, the median is the middle value; if even, it’s the average of the two middle values. The solution must run in O(log(m+n)). Constraints: 0 <= m,n <= 1000, 1 <= m+n <= 2000, values in [-10^6, 10^6]. */


/// Solución original
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    // Primero obtenemos el array completo, ordenado
    var mergedArray = nums1
    mergedArray.append(contentsOf: nums2)
    let sorted = mergedArray.sorted()
    
    // Obtenemos el número de elementos y la variable para guardar el resultado
    let n = sorted.count
    var median = 0.0
    
    // El cálculo de la mediana depende de si el número de elementos es par o impar.
    if n % 2 == 0 {
        median = (Double(sorted[n/2]) + Double(sorted[(n/2)-1]))/2
    } else {
        median = Double(sorted[n/2])
    }
    
    return median
}


/// Pruebas
findMedianSortedArrays([1, 3, 7, 13, 29], [2, 4, 8, 11, 15, 19])


/// ** Las instrucciones decían que no fusionáramos explícitamente los arreglos. Debo volver a revisar este problema siguiendo esas indicaciones...
