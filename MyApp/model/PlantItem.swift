import Foundation

struct PlantItem: Identifiable {
    let id = UUID()
    let name: String
    let room: String
    let light: String
    let water: String
    var isLoved: Bool
}
