//
//  PaymentsView.swift
//  Livio
//
//  Created by Toluwalase on 08/09/2026.
//

import SwiftUI

struct PaymentsScreen: View {
    
    @State private var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading){
            AppBarView(title: "Payments", isBackButton: true, defaultIcon: "notification-01",secondIcon: "settings-02", isSecondIcon: true)
                .padding(.top, 12)
                .padding(.horizontal, 20)
            Divider()
                .background(.gray300)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading){
                    HStack(alignment: .top){
                        VStack(alignment:.leading, spacing: 4){
                            HeadingText("Balance Due", fontSize: 13, color: .gray600)
                            
                            Text("\(Text("₦").foregroundStyle(.gray400)) 455,000.\(Text("00").foregroundStyle(.gray400))")
                                .font(.system(size: 29, weight: .medium))
                                .foregroundStyle(.gray800)
                        }
                        
                        Spacer()
                        
                        HeadingText("321 days left", fontSize: 13, fontWeight: .regular, color: .warning600)
                        
                    }
                    
                    VStack(alignment: .leading){
                        
                        HeadingText("Next payment scheduled for Jun 1st, 2026", fontSize: 13, fontWeight: .regular, color: .warning600)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.warning600.opacity(0.10))
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 12)
                    
                    Button {
                        showAlert.toggle()
                    }label: {
                        PrimaryButton(title: "Pay Rent", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                            .padding(.bottom, 12)
                    }
                    .sheet(isPresented: $showAlert){
                        VStack(alignment: .leading, spacing: 16){
                            HStack{
                                HeadingText("Pay Rent", fontSize: 19)
                                Spacer()
                                Button{
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .padding(12)
                                        .foregroundStyle(.gray600)
                                        .background(.gray100)
                                        .clipShape(Circle())
                                }
                            }
                            
                            ScrollView(showsIndicators: false){
                             
                         PayRentSheet()
                            
                                
                            }
                            
                            // rest of your sheet content here
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)   // <-- now correctly wraps the VStack
                        .padding(.horizontal, 20)
                        .padding(.top, 24)
//                        .presentationDetents([.fraction(0.5)])
                        .presentationDragIndicator(.visible)
                        .presentationBackground(.gray50)
                    }
                    
                    
                    
                    HStack{
                        HStack(spacing: 8){
                            Image("lock-sync-02")
                            HeadingText("Set Auto Play", fontSize: 15, color: .gray800)
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray50)
                                .stroke(Color.gray300)
                        )
                        Spacer()
                        
                        HStack(spacing: 8) {
                            Image("download-04")
                            HeadingText("Invoice", fontSize: 15, color: .gray800 )
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray50)
                                .stroke(Color.gray300)
                        )
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray100)
                        .stroke(.gray200,)
                )
                .padding(.bottom, 12)
                
                //                upcoming changes
                VStack(alignment:.leading, spacing: 12){
                    HStack{
                        HeadingText("Upcoming Charges", fontSize: 15, color: .gray900)
                        
                        Spacer()
                        
                        HeadingText("View Details", fontSize: 13, color: .gray900)
                            .underline()
                    }
                    .padding(.horizontal, 12)
                    
                    VStack(alignment:.leading, spacing: 12) {
                        HStack{
                            HStack(spacing: 10){
                                Image("utility-pole")
                                    .renderingMode(.template)
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background(.gray950)
                                    .clipShape(Circle())
                                
                                VStack(alignment:.leading, spacing: 2){
                                    HeadingText("Monthly Rent", fontSize: 15)
                                    HeadingText("Due Sept 1", fontSize: 13, fontWeight: .regular)
                                }
                            }
                            
                            Spacer()
                            
                            HeadingText("₦450,000.00", fontSize: 15)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray50)
                                .stroke(.gray300)
                        )
                        .padding(.horizontal, 12)
                        
                        HStack{
                            HStack(spacing: 10){
                                Image("utility-pole")
                                    .renderingMode(.template)
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background(.gray950)
                                    .clipShape(Circle())
                                
                                VStack(alignment:.leading, spacing: 2){
                                    HStack(spacing: 2) {
                                        HeadingText("Utilities", fontSize: 15)
                                        HeadingText("Fixed", fontSize: 13, color: .warning600)
                                            .padding(.vertical, 2)
                                            .padding(.horizontal,8)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(.white)
                                                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 1, )
                                            )
                                    }
                                    HeadingText("Due Sept 1", fontSize: 13, fontWeight: .regular)
                                }
                            }
                            
                            Spacer()
                            
                            HeadingText("₦5,000.00", fontSize: 15)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray50)
                                .stroke(.gray300)
                        )
                        .padding(.horizontal, 12)
                    }
                }
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.clear)
                        .stroke(.gray300)
                )
                .padding(.bottom, 16)
                
                
                PayMentHistory()
                
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
        }
        .background(
            .gray50
        )
    }
    
    private struct PayMentHistory : View {
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    HStack( spacing: 10) {
                        HeadingText("Payment History", fontSize: 15)
                        HeadingText("View all", fontSize: 13, color: .warning600)
                            .padding(.vertical, 2)
                            .padding(.horizontal,8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 1, )
                            )
                    }
                    Spacer()
                    Image("arrow-up-narrow-wide")
                }
                
                Divider()
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
                
                Divider()
                    .padding(.bottom, 12)
                
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
                
                Divider()
                    .padding(.bottom, 12)
            }
        }
    }
    
    
}

#Preview {
    PaymentsScreen()
}
