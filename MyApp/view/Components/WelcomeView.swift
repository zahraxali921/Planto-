import SwiftUI

struct WelcomeView: View {
    @Binding var showReminderSheet: Bool

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

            VStack(spacing: 24) {
                Image(.plant)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230, height: 230)

                VStack(spacing: 12) {
                    Text("Start your plant journey!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)

                    Text("Now all your plants will be in one place and\nwe will help you take care of them :)🪴")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
                .padding(.horizontal, 20)

                Button {
                    showReminderSheet = true
                } label: {
                    Text("Set Plant Reminder")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color(red: 0.16, green: 0.44, blue: 0.36))
                        .cornerRadius(25)
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
            }

            Spacer()
        }
    }
}
