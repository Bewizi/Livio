//
//  PropertiesView.swift
//  Livio
//
//  Created by Toluwalase on 13/08/2026.
//

import SwiftUI

struct PropertiesView: View {
    
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                VStack(alignment: .leading){
                    HeadingText("Manage your real estate portfolio across 8 active\n locations.",  fontSize: 15, color: .gray600)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .lineHeight(.leading(increase: 8))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray500)
                        TextField("Search by address or property name...", text: $searchText,
                        )
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .font(.system(size: 15))
                        .foregroundStyle(.gray950)
                        .tint(.gray600)
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 48)
                            .fill(Color.gray50)
                            .stroke(.gray300, lineWidth: 2)
                        
                    )
                    .padding(.bottom, 12)
                    
                    
                    HStack(alignment: .center){
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundStyle(.error600)
                        
                        HeadingText(title: Text("You have \(Text("4 new applicant").foregroundStyle(.goldenrod700)) inquiries for the\nupcoming vacant units at Harborview Towers."), fontSize: 13, color: .warning600)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .lineHeight(.leading(increase: 8))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity)
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.goldenrod700)
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.orange400.opacity(0.15))
                            .stroke(.orange400.opacity(0.50), lineWidth: 1)
                    )
                    
                    PropertyCard(
                        propertyName: "Harborview Towers", propertyAddress: "1248 Oceanside Blvd, Marina District", progressValue: 23, progressPercent: "23",
                        units: "24 Units", leased: "22/24 Leased"
                    )
                        .padding(.top, 16)
                    
                    PropertyCard(
                        propertyName: "Brick & Beam Lofts", propertyAddress: "202 Industrial Ave, Downtown", progressValue: 92, progressPercent: "92",
                        units: "36 Units", leased: "36/36 Leased"
                    )
                        .padding(.top, 12)
                    
                    
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray50)
                .padding(.bottom, 96)
                }
                
                FloatingAddButton {
                    
                }
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
            .navigationTitle("Property Directory")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "ellipsis")
                    }
                    .accessibilityLabel("Property Directory")
                    .accessibilityAddTraits(.isHeader)
                }
            }
            .toolbarColorScheme(.none)
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    PropertiesView()
}
