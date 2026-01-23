/*  217. Contains duplicate [easy] - Array, Hash Table.
Dado un arreglo de enteros nums, devuelve true si algún valor aparece al menos dos veces, y false si todos los elementos son distintos. La longitud del arreglo está entre 1 y 10^5, y los valores están entre -10^9 y 10^9.

Given an integer array nums, return true if any value appears at least twice, and false if every element is distinct. The array length ranges from 1 to 10^5, and values are between -10^9 and 10^9. */

///
/// Original Solution. Time Complexity: O(n), Space Complexity: O(n). Beats 98% in Runtime & 38% in Memory.
///
func containsDuplicate(_ nums: [Int]) -> Bool {
    Set(nums).count != nums.count
}


///
/// Test cases
///
containsDuplicate([1, 2, 3, 1]) // Expected: true
containsDuplicate([1, 2, 3, 4]) // Expected: false
containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) // Expected: true
