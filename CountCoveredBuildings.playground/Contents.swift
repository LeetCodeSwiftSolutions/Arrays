/* CONTEO DE EDIFICIOS CUBIERTOS.
Dado un entero n (tamaño de ciudad) y una lista de coordenadas únicas de edificios, cuenta cuántos edificios tienen al menos un edificio en las cuatro direcciones cardinales (arriba, abajo, izquierda, derecha). n está entre 2 y 10⁵, y hay hasta 10⁵ edificios.

Given an integer n (city size) and a list of unique building coordinates, count how many buildings have at least one building in all four cardinal directions (up, down, left, right). n is between 2 and 10⁵, and there are up to 10⁵ buildings. */

/// Solución original (no es lo suficientemente rápida)
func countCoveredBuildings(_ n: Int, _ buildings: [[Int]]) -> Int {
    // The city must be at least 3×3 for covered buildings to exist
    guard n > 2 else { return 0 }
    var columns = [[Int]]()
    var rows = [[Int]]()
    var coveredBuildings: Int = 0
    for i in 2 ... n-1 {
        // Filtramos building para obtener un subarreglo que contenga solo los elementos en la columna i
        let col = buildings.filter{$0[0] == i}
        // Necesitamos al menos 3 elementos en la columna para poder tener edificios cubiertos
        if col.count < 3 { continue }
        // Ordenamos los elementos de la columna para poder retirar los extremos.
        var sortedCol = col.sorted{$0[1] < $1[1]}
        sortedCol.removeFirst()
        sortedCol.removeLast()
        for building in sortedCol {
            columns.append(building)
        }
    }
    // Hacemos el proceso equivalente para las filas
    for j in 2 ... n-1 {
        let row = buildings.filter{$0[1] == j}
        if row.count < 3 { continue }
        var sortedRow = row.sorted{$0[0] < $1[0]}
        sortedRow.removeFirst()
        sortedRow.removeLast()
        for building in sortedRow {
            rows.append(building)
        }
    }
    // Si cualquiera de las matrices auxiliares está vacía, no hay edificios cubiertos.
    guard !columns.isEmpty && !rows.isEmpty else {
        return 0
    }
    // Si los edificios se encuentran en rows y columns, están cubiertos en las 4 direcciones.
    for building in rows {
        if columns.contains(where: { $0 == building }) {
            coveredBuildings += 1
        }
    }
    return coveredBuildings
}


/// Pruebas iniciales
let buildings = [[1,5],[10,5],[5,1],[5,10], [5,2],[5,3],[5,4],[5,5],[5,6],[5,7],[5,8],[5,9], [2,5],[3,5],[4,5],[6,5],[7,5],[8,5],[9,5], [2,2],[9,9],[2,9],[9,2], [3,3],[8,8],[3,8],[8,3], [4,4],[7,7], [6,6]]
countCoveredBuildings(10, buildings) // Expected: 9

let buildings2 = [[1,6],[13,6], [6,1],[6,13], [6,2],[6,3],[6,4],[6,5],[6,7],[6,8],[6,9],[6,10],[6,11],[6,12], [2,6],[3,6],[4,6],[5,6],[7,6],[8,6],[9,6],[10,6],[11,6],[12,6], [2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10],[11,11],[12,12], [1,1],[1,13],[13,1],[13,13], [2,12],[12,2],[3,11],[11,3],[4,10],[10,4],[5,9],[9,5],[7,5],[5,7], [4,6], [6,4]]
countCoveredBuildings(13, buildings2) // Expected: 21



/// Solución optimizada con Deepseek.
func countCoveredBuildingsOptimized(_ n: Int, _ buildings: [[Int]]) -> Int {
    // La ciudad debe de ser de al menos 3x3 para que existan edificios cubiertos.
    guard n > 2 else { return 0 }
    // Creamos diccionarios que van a almacenar todos los edificios por filas y columnas,
    var buildingsByColumn: [Int: [(Int, Int)]] = [:] // (Coordenada en Y, ID del enumerated())
    var buildingsByRow: [Int: [(Int, Int)]] = [:]    // (Coordenada en X, ID del enumerated())
    // Asignar IDs únicos a los edificios
    for (id, building) in buildings.enumerated() {
        let x = building[0]
        let y = building[1]
        buildingsByColumn[x, default: []].append((y, id))
        buildingsByRow[y, default: []].append((x, id))
    }
    // Creamos sets para el manejo efectivo de los datos almacenados finales
    var verticallyCovered = Set<Int>()
    var horizontallyCovered = Set<Int>()
    // Procesamos columnas
    for i in 2...n-1 {
        guard let col = buildingsByColumn[i], col.count >= 3 else { continue }
        // Creamos un arreglo de tuplas ordenadas por su coordenada en y, de menor a mayor
        let sortedCol = col.sorted { $0.0 < $1.0 }
        // Anexamos los IDs de los edificios internos, sin contar los de los extremos
        for index in 1..<(sortedCol.count - 1) {
            verticallyCovered.insert(sortedCol[index].1)
        }
    }
    // Procesamos filas
    for j in 2...n-1 {
        guard let row = buildingsByRow[j], row.count >= 3 else { continue }
        let sortedRow = row.sorted { $0.0 < $1.0 }
        for index in 1..<(sortedRow.count - 1) {
            horizontallyCovered.insert(sortedRow[index].1)
        }
    }
    // Retornamos el conteo de la intersección (a partir de los IDs), de los sets
    return horizontallyCovered.intersection(verticallyCovered).count
}

