//
//  AgreeAndContView.swift
//  Livio
//
//  Created by Toluwalase on 09/08/2026.
//

import SwiftUI

struct AgreeAndContView: View {
    var body: some View {
        VStack(alignment: .leading){
//            logo
            Image(.logo)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.bottom, 30)
//            container guideline
            RegularText("Livio guidelines", color: .gray700)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.gray100)
                )
                .padding(.bottom, 14)
            
//            header
            HeadingText("Livio is built on trust, respect, and transparency")
                .lineHeight(.leading(increase: 10))
                .padding(.bottom, 20)
            
//            long text
            Text(
                "To create a safe and positive experience for both tenants and landlords, we ask that you commit to the following: \n \nI agree to communicate respectfully, honor agreements, provide accurate information, and treat all members of the Livio community fairly and professionally.\n \nWhether renting a property or managing one, we believe every interaction should be built on trust, accountability, and mutual respect. \n \n \(Text("Learn More").foregroundStyle(.gray950).font(.system(size: 15, weight: .medium)))",
                
                
            )
            .font(.system(size: 15))
            .foregroundStyle(.greu600)
            .lineHeight(.leading(increase: 10))
            .padding(.bottom, 56)
            
//            two buttons
            VStack(alignment: .leading){
                Button{
                    
                }label: {
                    PrimaryButton(title: "Agree & Continue", isBackgroundColor: true, isBorder: false, titleColor: .white)
                }.padding(.bottom, 8)
                
                Button{
                    
                }label: {
                    PrimaryButton(title: "Disagree", isBackgroundColor: false, isBorder: true, titleColor: .primaryButton)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

#Preview {
    AgreeAndContView()
}
