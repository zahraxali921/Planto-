import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PlantsViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.black.ignoresSafeArea()

            if viewModel.plants.isEmpty {
                WelcomeView(showReminderSheet: $viewModel.showReminderSheet)
            } else if viewModel.isAllCompleted {
                AllDoneView()
            } else {
                PlantListView(viewModel: viewModel)
            }

            if !viewModel.plants.isEmpty {
                Button {
                    viewModel.showReminderSheet = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color(red: 0.35, green: 0.75, blue: 0.62))
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $viewModel.showReminderSheet) {
            SetReminderView(isEditing: false) { newPlant in
                viewModel.addPlant(newPlant)
            }
        }
    }
}

#Preview {
    ContentView()
}
