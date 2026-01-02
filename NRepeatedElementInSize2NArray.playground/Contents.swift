/* ELEMENTO REPETIDO N VECES EN UN ARREGLO DE LONGITUD 2N.
Dado un arreglo de enteros con longitud 2*n, que contiene n+1 elementos únicos y exactamente un elemento se repite n veces, encuentra y devuelve ese elemento repetido. El valor de n está entre 2 y 5000, y los elementos están entre 0 y 10^4.

Given an integer array of length 2*n containing n+1 unique elements and exactly one element repeated n times, find and return that repeated element. The value of n ranges from 2 to 5000, and elements are between 0 and 10^4. */

/// Original solution. Time complexity: O(n), Space complexity: O(n). Beats 100% & 100%
func repeatedNTimes(_ nums: [Int]) -> Int {
    // We create an empty set to store unique elements until a duplicate is found
    var hash = Set<Int>()
    for num in nums {
        // If the current element is already in the set, it's the duplicate
        if hash.contains(num) { return num }
        // Otherwise, add this unique element to the set
        else { hash.insert(num) }
    }
    // We return -1 if no duplicate is found (though problem guarantees one exists)
    return -1
}


/// Test cases
repeatedNTimes([3,5,1,5]) // Expected: 5
repeatedNTimes([0,0,0,0,0,1,2,3,4,5]) // Expected: 0
repeatedNTimes([13,17,12,10,45,6,13,50,13,30,23,13,22,13,13,13,13,13]) // Expected: 13
