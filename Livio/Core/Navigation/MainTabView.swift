//
//  NavigationView.swift
//  Livio
//
//  Created by Toluwalase on 13/08/2026.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {

            // Content
            Group {
                switch selectedTab {
                case 0:
                    HomeView()

                case 1:
                    PropertiesView(navigateToPDViews: .constant(false))

                case 2:
                    MessagesView()

                case 3:
                    PaymentsView()

                case 4:
                    ProfileView()

                default:
                    HomeView()
                }
            }

            // Custom Tab Bar
            HStack(alignment: .bottom) {
                tabButton(title: "Home", icon: selectedTab == 0 ? "home-01" : "home-01", index: 0)

                tabButton(title: "Properties", icon: selectedTab == 1 ? "building-01" : "building-01", index: 1)

                tabButton(title: "Messages", icon:selectedTab == 2 ? "message-multiple-02" : "message-multiple-02", index: 2)

                tabButton(title: "Payments", icon: selectedTab == 3 ? "credit-card-pos" : "credit-card-pos", index: 3)

                tabButton(title: "More", icon: selectedTab == 4 ? "more-horizontal-circle-01" : "more-horizontal-circle-01", index: 4)
            }
            .padding(.top, 8)
            .padding(.bottom, 8)
            .padding(.horizontal, 20)
        }.background(.gray50)
    }

    @ViewBuilder
    private func tabButton(
        title: String,
        icon: String,
        index: Int
    ) -> some View {

        Button {
            selectedTab = index
        } label: {

            VStack(spacing: 4) {

                Image(icon)
                    .font(.system(size: 24))
                    .tint(
                        selectedTab == index
                            ? Color.primaryButton
                            : Color.gray600
                    )

                Text(title)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.system(size: 13))
                    .foregroundStyle(
                        selectedTab == index
                            ? Color.primaryButton
                            : Color.gray600
                    )
            }
            
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MainTabView()
}
