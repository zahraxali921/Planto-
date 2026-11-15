import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack {
            HStack {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)

            Spacer()

            VStack(spacing: 20) {
                Image(.نبته)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)

                VStack(spacing: 8) {
                    Text("All Done! 🎉")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)

                    Text("All Reminders Completed")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
    }
}
