//
//  PropertyAmenitiesSection.swift
//  Livio
//
//  Created by Toluwalase on 21/08/2026.
//

import SwiftUI


struct PropertyAmenitiesSection: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]
    
    
    var amenities = [
        ("swimming", "Rooftop Pool"),
        ("equipment-gym-03", "24/7 Gym"),
        ("car-parking-02", "Private Garage"),
        ("pool-table", "Snooker Room"),
        ("washing-machine", "In-Unit Laundry"),
        ("wifi-01", "Gigabit Fiber"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
        HeadingText("Premium Amenities", fontSize: 15, color: .gray900)
            LazyVGrid(columns: columns){
                ForEach(amenities, id: \.0,){
                    items in
                    PremiumAmenities(
                        icon: items.0,
                        title: items.1
                    )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)

                .stroke(.gray300)
        )
        .padding(.top, 24)
        .padding(.bottom, 24)
        
        AddPropertyAmenities()
        
        
        
        
    }
}

struct AddPropertyAmenities: View {
    
    @State var isShowingSheet = false
    @State private var fullAddress = ""
    @FocusState private var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
    ]
    
    var amenities = [
        ("swimming", "Rooftop Pool"),
        ("equipment-gym-03", "24/7 Gym"),
        ("car-parking-02", "Private Garage"),
        ("pool-table", "Snooker Room"),
    ]
    
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                HeadingText("Premium Amenities", fontSize: 15, color: .gray900)
                Spacer()
                Button(){
                    isShowingSheet.toggle()
                }label: {
                    Label("Add", systemImage: "plus" )
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(.gray900)
                }.sheet(isPresented: $isShowingSheet){
                    ScrollView {
                        VStack(alignment: .leading){
                            
                            HStack {
                                HeadingText("Add Premium Amenities", fontSize: 19)
                                Spacer()
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .padding(12)
                                        .foregroundStyle(.gray600)
                                        .background(
                                            Circle()
                                                .fill(.gray100)
                                        )
                                }
                            }
                            .padding(.bottom, 24)
                            
                            VStack(alignment: .leading){
                                HeadingText("Category", fontSize: 15)
                                    .padding(.bottom, 12)
                                TextField("Rooftop Pool", text: $fullAddress)
                                    .foregroundStyle(.gray600)
                                    .font(.system(size: 15))
                                    .padding(12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.gray300)
                                    )
                                
                                    .onSubmit {
                                        print(fullAddress)
                                    }
                                    .focused($isFocused)
                                    .onAppear{
                                        isFocused = true
                                    }
                                    .colorScheme(.light)
                                
                                TextField("icon", text: $fullAddress)
                                    .foregroundStyle(.gray600)
                                    .font(.system(size: 15))
                                    .padding(12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.gray300)
                                    )
                                
                                    .onSubmit {
                                        print(fullAddress)
                                    }
                                    .focused($isFocused)
                                    .onAppear{
                                        isFocused = true
                                    }
                                    .colorScheme(.light)
                                    .padding(.top, 12)
                                
                                Label("Suggest Icon", image: "magic-wand-03")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 13))
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 24)
                                            .fill(.primaryButton.gradient)
                                    )
                                    .padding(.top, 12)
                            }
                            
                            VStack(spacing: 8){
                                Button(action: {}){
                                    PrimaryButton(title: "Save changes", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .goldenrod500)
                                }
                                Button(action: {}){
                                    PrimaryButton(title: "Cancel", isBackgroundColor: false, isBorder: true, titleColor: .primaryButton, backgroundColor: .gray50)
                                }
                            }
                            .padding(.top, 24)
                            .padding(.bottom, 24)
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 40)
                        .presentationDetents([.medium])
                        .presentationBackground(.gray50)
                    }
                    
                }
                
                
            }
            .padding(.bottom, 12)
            LazyVGrid(columns: columns, alignment: .leading){
                ForEach(amenities, id: \.0,){
                    items in
                    PremiumAmenities(
                        icon: items.0,
                        title: items.1
                    )
                }
            }
        }
        
    }
}

#Preview {
    PropertyAmenitiesSection()
}



@ViewBuilder
func PremiumAmenities(
icon: String,
title: String
) -> some View{
    HStack{
        Image(icon)
        Text(title)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
    .font(.system(size: 13,weight: .medium))
    .foregroundStyle(.gray800)
    .background(
        RoundedRectangle(cornerRadius: 12)
            .fill(.gray100)
            .stroke(.gray300)
    )
    
}
