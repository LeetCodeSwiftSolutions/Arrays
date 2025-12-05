/* SUMAS PARES DE PARTICIONES EN UN ARREGLO
Dado un arreglo de enteros nums, encuentra el número de particiones donde el índice i divide el arreglo en dos subarreglos no vacios, y la diferencia entre la suma del subarreglo izquierdo y el derecho es un número par. La longitud del arreglo está entre 2 y 100, y cada elemento entre 1 y 100.

Given an integer array nums, find the number of partitions where index i splits the array into two non-empty subarrays, and the difference between the sum of the left subarray and the right subarray is even. The array length ranges from 2 to 100, with each element between 1 and 100. */

/// Solución original
func countPartitions(_ nums: [Int]) -> Int {
    var sum1=0, sum2=0, count=0, n = nums.count
    for i in 1..<n {
        sum1 = nums[0..<i].reduce(0, +)
        sum2 = nums[i..<n].reduce(0, +)
        if (sum1-sum2) % 2 == 0 { count += 1 }
    }
    return count
}

/// Pruebas
print(countPartitions([10,10,3,7,6]))
print(countPartitions([2,4,6,8]))
print(countPartitions([10,2]))
