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
                    PropertiesView()

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
                tabButton(title: "Home", icon: selectedTab == 0 ? "house.fill" : "house", index: 0)

                tabButton(title: "Properties", icon: selectedTab == 1 ? "building.2.fill" : "building.2", index: 1)

                tabButton(title: "Messages", icon:selectedTab == 2 ? "message.fill" : "message", index: 2)

                tabButton(title: "Payments", icon: selectedTab == 3 ? "creditcard.fill" : "creditcard", index: 3)

                tabButton(title: "More", icon: selectedTab == 4 ? "ellipsis.circle.fill" : "ellipsis.circle", index: 4)
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

                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(
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
