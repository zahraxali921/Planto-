import SwiftUI
import Combine

class PlantsViewModel: ObservableObject {
    @Published var plants: [PlantItem] = []
    @Published var showReminderSheet = false

    var lovedCount: Int {
        plants.filter { $0.isLoved }.count
    }

    var isAllCompleted: Bool {
        !plants.isEmpty && lovedCount == plants.count
    }

    var progress: CGFloat {
        CGFloat(lovedCount) / CGFloat(max(plants.count, 1))
    }

    func addPlant(_ plant: PlantItem) {
        plants.append(plant)
    }

    func toggleLoved(for plant: PlantItem) {
        guard let index = plants.firstIndex(where: { $0.id == plant.id }) else { return }
        plants[index].isLoved.toggle()
    }
}
