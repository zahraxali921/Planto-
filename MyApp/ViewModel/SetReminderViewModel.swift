import SwiftUI
import Combine

class SetReminderViewModel: ObservableObject {
    @Published var plantName = ""
    @Published var selectedRoom = "Bedroom"
    @Published var selectedLight = "Full Sun"
    @Published var wateringDays = "Every day"
    @Published var waterAmount = "20-50 ml"

    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lights = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]

    func makePlant() -> PlantItem {
        PlantItem(
            name: plantName.isEmpty ? "My Plant" : plantName,
            room: selectedRoom,
            light: selectedLight,
            water: waterAmount,
            isLoved: false
        )
    }
}
