/* CONTENEDOR CON MÁS AGUA.
Dado un arreglo height donde cada elemento representa la altura de una línea vertical, encuentra dos líneas que, junto con el eje x, formen un contenedor que almacene la máxima cantidad de agua posible. El área se calcula como la distancia entre índices multiplicada por la menor de las dos alturas. La longitud del arreglo está entre 2 y 10⁵, con alturas entre 0 y 10⁴

Given an array height where each element represents the height of a vertical line, find two lines that together with the x-axis form a container storing the maximum amount of water. The area is calculated as the distance between indices multiplied by the smaller of the two heights. The array length ranges from 2 to 10⁵, with heights between 0 and 10⁴ */

/// Solución original (optimizada con IA). Time complexity: O(n), Space complexity: O(1). Beats 100% and 95%.
func maxArea(_ height: [Int]) -> Int {
    var right = height.count - 1
    var maxArea = 0
    var left = 0
    
    while left < right {
        // Calculamos el area de la combinación actual
        let currentArea = (right - left) * min(height[left], height[right])
        // Actualizamos el área máxima con un método nativo de Swift
        maxArea = max(maxArea, currentArea)
        // Movemos solamente el puntero con la altura más pequeña
        // Ese procedimiento <<asegura>> que encontremos la combinación óptima en alguna iteración.
        if height[left] < height[right] {
            // Movemos el puntero más bajo, buscando na posible altura mayor que compense la reducción de distancia.
            left += 1
        }
        else {
            // En caso de que las alturas sean iguales, basta con mover un solo puntero.
            right -= 1
        }
    }
    return maxArea
}

/// Pruebas
var height: [Int] = Array(repeating: 10000, count: 100000)
maxArea(height) // Expected: 999990000 (in ~5 seconds)


