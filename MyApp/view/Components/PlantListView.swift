import SwiftUI

struct PlantListView: View {
    @ObservedObject var viewModel: PlantsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            VStack(spacing: 12) {
                Text("\(viewModel.lovedCount) of your plants feel loved today✨")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color(.systemGray6).opacity(0.3))
                            .frame(height: 6)
                            .cornerRadius(3)

                        Rectangle()
                            .fill(Color(red: 0.35, green: 0.75, blue: 0.62))
                            .frame(width: geometry.size.width * viewModel.progress, height: 6)
                            .cornerRadius(3)
                    }
                }
                .frame(height: 6)
            }
            .padding(.horizontal, 20)
            .padding(.top, 5)

            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.plants) { plant in
                        VStack(spacing: 0) {
                            HStack(spacing: 15) {
                                Button {
                                    viewModel.toggleLoved(for: plant)
                                } label: {
                                    Image(systemName: plant.isLoved ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: 26))
                                        .foregroundColor(plant.isLoved ? Color(red: 0.35, green: 0.75, blue: 0.62) : .gray)
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("in \(plant.room)")
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)

                                    Text(plant.name)
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundColor(.white)

                                    HStack(spacing: 10) {
                                        Label(plant.light, systemImage: "sun.max")
                                            .font(.system(size: 12))
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color(.systemGray6).opacity(0.15))
                                            .cornerRadius(8)
                                            .foregroundColor(.gray)

                                        Label(plant.water, systemImage: "drop")
                                            .font(.system(size: 12))
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color(.systemGray6).opacity(0.15))
                                            .cornerRadius(8)
                                            .foregroundColor(.gray)
                                    }
                                }

                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)

                            Divider()
                                .background(Color.gray.opacity(0.2))
                        }
                    }
                }
            }

            Spacer()
        }
    }
}
