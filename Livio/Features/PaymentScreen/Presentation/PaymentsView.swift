//
//  PaymentsView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct PaymentsView: View {
    @State private var searchText = ""
    @State private var selectedFilter : String  = "All"
    
    @State private var filters: [String] = [
        "All",
        "Received",
        "Pending",
        "Overdue"
    ]
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                AppBarHeader()
                    .padding(.trailing, 20)
                
                Divider()
                    .background(.gray300)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment:.leading){
                        VStack{
                            HStack(alignment: .top){
                                VStack(alignment:.leading, spacing: 4){
                                    HeadingText("Total Revenue this Month", fontSize: 13, color: .gray600)
                                    
                                    Text("\(Text("₦").foregroundStyle(.gray400)) 20,500,000.\(Text("00").foregroundStyle(.gray400))")
                                        .font(.system(size: 29, weight: .medium))
                                        .foregroundStyle(.gray800)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "eye.slash")
                                    .font(.system(size: 14))
                                    .padding(12)
                                    .foregroundStyle(.gray500)
                                    .background(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(.gray300)
                                    )
                                
                            }
                            
                            HStack{
                                pendingAmountCard
                                Spacer()
                                maintenanceExpensesCard
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.gray100)
                                .stroke(.gray200,)
                        )
                        .padding(.bottom, 12)
                        
                        VStack(spacing: 12){
                            HStack {
                                HeadingText("Collection Progress", fontSize: 15, color: .gray800)
                                Spacer()
                                HStack(spacing: 12){
                                    Image(systemName: "arrow.left")
                                        .foregroundStyle(.gray500)
                                    Image(systemName: "arrow.right")
                                        .foregroundStyle(.gray800)
                                }
                            }
                            
                            VStack(spacing: 16){
                                
                                VStack{
                                    CollectionProgressBar(value: 0.45)
                                    
                                }
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.gray100)
                                        .stroke(.gray300)
                                )
                                
                                HStack{
                                    HeadingText("Collected: 20.5M", fontSize: 13, color: .gray600)
                                    Spacer()
                                    HeadingText("Target: ₦32.8M", fontSize: 13, color: .gray600)
                                    
                                }
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.gray100)
                                        .stroke(.gray300)
                                )
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray300)
                            )
                        }
                        
                        //                    search
                        HStack(spacing: 8) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray500)
                                .font(.system(size: 20))
                            TextField("Search tenants, units, or methods...", text: $searchText,
                            )
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .font(.system(size: 15))
                            .foregroundStyle(.gray950)
                            .tint(.gray600)
                            .colorScheme(.light)
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(.gray300)
                        )
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                        
                        //                    filter by
                        VStack(spacing: 16) {
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 8) {
                                    ForEach(filters, id: \.self){
                                        filter in
                                        FilterChip(title:filter , isSelected: selectedFilter == filter)
                                            .onTapGesture {
                                                selectedFilter = filter
                                            }
                                    }
                                    
                                }
                                
                            }
                            
                            RecentTransaction()
                        }
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                }
                
                
                
            }
            .padding(.top, 20)
            .background(.gray50)
        }
    }
    
    private var pendingAmountCard: some View {
        MetricCard(title: "Pending Amount", amount: 12_350_000, currencySymbol: "₦")
    }

    private var maintenanceExpensesCard: some View {
        MetricCard(title: "Maintenance Expenses", amount: 550_000, currencySymbol: "₦")
    }
    
   private struct MetricCard: View {
        let title: String
        let amount: Int
        let currencySymbol: String

        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                HeadingText(title, fontSize: 13, fontWeight: .regular, color: .gray600)
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text(currencySymbol).foregroundStyle(.gray400)
                    Text("\(amount.formatted())")
                    Text("00").foregroundStyle(.gray400)
                }
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.gray800)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray50)
                    .stroke(.gray300)
            )
        }
    }
    
    private struct FilterChip: View {
        let title: String
        let isSelected: Bool
        var body: some View {
            HStack(spacing: 4) {
                HeadingText(title, fontSize: 13, color: isSelected ? .white : .gray600)
                Circle()
                    .frame(width: 5, height: 5)
            }
            .foregroundStyle(isSelected ? .white : .clear)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(isSelected ? Color.primaryButton.gradient : Color.clear.gradient )
                    .stroke(isSelected ? .clear : .gray300)
            )
            
        }
    }
    
    private struct RecentTransaction : View {
        var body: some View {
            VStack(alignment: .leading) {
                HeadingText("Recent Transactions", fontSize: 15)
                    .padding(.top, 16)
                    .padding(.bottom, 12)
                
                
                HStack{
                    VStack(alignment:.leading, spacing: 8){
                        HeadingText("Jacklyn Tilley-Gyado", fontSize: 15, color: .gray900)
                        Text("\(Text("Unit 208").foregroundStyle(.goldenrod500)) •  Bank Transfer")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(.gray800)
                        HeadingText("June 15", fontSize: 13, fontWeight: .regular, color: .gray500)
                    }
                    Spacer()
                    VStack(alignment:.trailing, spacing: 10){
                        HeadingText("₦1,850,000.00", fontSize: 15, color: .gray900)
                        HeadingText("Success", fontSize: 10, color: .success600)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(.success600.opacity(0.10))
                            )
                    }
                }
                .padding(.bottom, 16)
                
                HStack{
                    VStack(alignment:.leading, spacing: 8){
                        HeadingText("Elena Rochukwu", fontSize: 15, color: .gray900)
                        HeadingText("Unit 228", fontSize: 13, color: .goldenrod500)
                        HeadingText("Due June 12", fontSize: 13, fontWeight: .regular, color: .gray500)
                    }
                    Spacer()
                    VStack(alignment:.trailing, spacing: 10){
                        HeadingText("₦350,000.00", fontSize: 15, color: .gray900)
                        HeadingText("Overdue", fontSize: 10, color: .error600)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(.error600.opacity(0.10))
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    PaymentsView()
}


