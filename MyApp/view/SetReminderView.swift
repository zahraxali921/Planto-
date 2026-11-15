import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = SetReminderViewModel()

    var isEditing: Bool = false
    var onSave: (PlantItem) -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.gray.opacity(0.3))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Text(isEditing ? "Edit Reminder" : "Set Reminder")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    Button {
                        onSave(viewModel.makePlant())
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color(red: 0.16, green: 0.44, blue: 0.36))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                HStack {
                    Text("Plant Name").foregroundColor(.gray)
                    TextField("e.g. Pothos", text: $viewModel.plantName)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color(.systemGray6).opacity(0.15))
                .cornerRadius(16)
                .padding(.horizontal)
                .padding(.top, 10)

                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "location.north").foregroundColor(.white)
                        Text("Room").foregroundColor(.white)
                        Spacer()
                        Picker("", selection: $viewModel.selectedRoom) {
                            ForEach(viewModel.rooms, id: \.self) { Text($0).tag($0) }
                        }
                        .pickerStyle(.menu)
                        .accentColor(.gray)
                    }
                    .padding()

                    Divider().background(Color.gray.opacity(0.3))

                    HStack {
                        Image(systemName: "sun.max").foregroundColor(.white)
                        Text("Light").foregroundColor(.white)
                        Spacer()
                        Picker("", selection: $viewModel.selectedLight) {
                            ForEach(viewModel.lights, id: \.self) { Text($0).tag($0) }
                        }
                        .pickerStyle(.menu)
                        .accentColor(.gray)
                    }
                    .padding()
                }
                .background(Color(.systemGray6).opacity(0.15))
                .cornerRadius(16)
                .padding(.horizontal)

                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "drop").foregroundColor(.white)
                        Text("Watering Days").foregroundColor(.white)
                        Spacer()
                        Picker("", selection: $viewModel.wateringDays) {
                            ForEach(viewModel.wateringOptions, id: \.self) { Text($0).tag($0) }
                        }
                        .pickerStyle(.menu)
                        .accentColor(.gray)
                    }
                    .padding()

                    Divider().background(Color.gray.opacity(0.3))

                    HStack {
                        Image(systemName: "drop.fill").foregroundColor(.white)
                        Text("Water").foregroundColor(.white)
                        Spacer()
                        Picker("", selection: $viewModel.waterAmount) {
                            ForEach(viewModel.waterOptions, id: \.self) { Text($0).tag($0) }
                        }
                        .pickerStyle(.menu)
                        .accentColor(.gray)
                    }
                    .padding()
                }
                .background(Color(.systemGray6).opacity(0.15))
                .cornerRadius(16)
                .padding(.horizontal)

                Spacer()

                if isEditing {
                    Button { dismiss() } label: {
                        Text("Delete Reminder")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6).opacity(0.15))
                            .cornerRadius(25)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
