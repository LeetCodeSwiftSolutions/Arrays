/* CHECADOR DE ALTURA.
Dado un arreglo heights con las alturas de los estudiantes, ordénalo de forma no decreciente para obtener el orden esperado. Devuelve el número de índices donde la altura actual difiere de la ordenada. La longitud está entre 1 y 100, y las alturas entre 1 y 100.

Given an array heights of student heights, sort it in non-decreasing order to get the expected order. Return the number of indices where the current height differs from the sorted one. The length ranges from 1 to 100, and heights are between 1 and 100. */

/// Original Solution. Time Complexity: O(nlogn), Space Complexity: O(n). Beats 100% & 39%
func heightChecker(_ heights: [Int]) -> Int {
    let sortedHeights = heights.sorted()
    var diff = 0
    for index in 0..<heights.count {
        if heights[index] != sortedHeights[index] { diff += 1 }
    }
    return diff
}


/// Test cases
heightChecker([13, 13, 15, 14, 16, 17, 18, 18, 17, 20, 19, 22]) // Expected: 6
heightChecker([10,10,14,12,11,13]) // Expected: 3
heightChecker([15,11,12,13,14]) // Expected: 5
