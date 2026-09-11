//
//  PayRentSheet.swift
//  Livio
//
//  Created by Toluwalase on 11/09/2026.
//

import SwiftUI

struct PayRentSheet: View {
    var body: some View {
        
        @State var isOn: Bool = true
        VStack(alignment:.leading){
            
            VStack(alignment:.leading) {
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
                .padding(.bottom, 12)
                
                VStack(alignment:.leading, spacing:  4){
                    HeadingText("Apartment Number", fontSize: 13, fontWeight: .regular, color: .gray400)
                    HeadingText("Unit 208", fontSize: 15, color: .gray800)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .stroke(.gray300)
                )
                
              
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray100)
                    .stroke(.gray300)
            )
            .padding(.vertical, 12)
            
            Toggle("Add utility bill", isOn: $isOn)
                .tint(.goldenrod500)
                
            
            VStack(alignment:.leading, spacing: 12){
                PayRentSheet_Previews(label: "Monthly Rent", amount: "₦450,000.00")
                Divider()
                PayRentSheet_Previews(label: "Utilities", amount: "₦5,000.00")
                Divider()
                PayRentSheet_Previews(label: "Total", amount: "₦455,000.00", fontWeight: .medium, fontSize: 19)
                
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.gray100)
                    .stroke(.gray200)
            )
            .padding(.vertical, 12)
            
            VStack(alignment:.leading, spacing: 12){
                HeadingText("Payment Method", fontSize: 15)
                    .padding(.bottom, 8)
                
                HStack {
                    HStack {
                        Image(systemName: "creditcard.fill")
                        HeadingText("**** **** **** 7496", fontSize: 15, color: .gray800)
                    }
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .stroke(.gray300)
                )
                .padding(.bottom, 12)
                
                Button{}label: {
                    HeadingText("Add new payment method", fontSize: 15, fontWeight: .regular, color: .gray50)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.goldenrod500)
                )
                
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [6, 4]))
                    .foregroundStyle(.gray300)
            )
            
            
            VStack(spacing: 8){
                Button(action: {}){
                    PrimaryButton(title: "Confirm Payment - ₦455,000", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                }
                Button(action: {}){
                    PrimaryButton(title: "Cancel", isBackgroundColor: false, isBorder: true, titleColor: .primaryButton, backgroundColor: .gray50)
                }
            }
            .padding(.top, 24)
            .padding(.bottom, 24)
            
        }
    }
}

struct PayRentSheet_Previews: View {
    let label: String
    let amount: String
    var fontWeight: Font.Weight?
    var fontSize: CGFloat?
    
    var body: some View {
        HStack {
            HeadingText(label, fontSize: fontSize ?? 13, fontWeight: fontWeight ?? .regular, color: .gray800)
            Spacer()
            HeadingText(amount, fontSize: fontSize ?? 13, fontWeight: fontWeight ?? .regular, color: .gray800)
        }
    }
}

#Preview {
    PayRentSheet()
}
