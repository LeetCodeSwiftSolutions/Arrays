/*  217. Contains duplicate [easy] - Array, Hash Table.
Dado un arreglo de enteros nums, devuelve true si algún valor aparece al menos dos veces, y false si todos los elementos son distintos. La longitud del arreglo está entre 1 y 10^5, y los valores están entre -10^9 y 10^9.

Given an integer array nums, return true if any value appears at least twice, and false if every element is distinct. The array length ranges from 1 to 10^5, and values are between -10^9 and 10^9. */

///
/// Original Solution.
/// Time Complexity: O(n), Space Complexity: O(n).
/// Beats 98% in Runtime & 38% in Memory.
///
func containsDuplicate(_ nums: [Int]) -> Bool {
    Set(nums).count != nums.count
}


///
/// Original test cases
///
containsDuplicate([-10, 7, -1, 19, -15, 7]) // Expected: true
containsDuplicate([-80, -70, -60, -50, -40, -30]) // Expected: false
containsDuplicate([5, 10, 15, 15, 20, 25, 25, 30, 35]) // Expected: true
