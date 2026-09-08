//
//  AddPropertyView.swift
//  Livio
//
//  Created by Toluwalase on 24/08/2026.
//

import SwiftUI

struct AddPropertyView: View {
    
    @State private var firstName = ""
    @State private var fullAddress = ""
    @State private var category = ""
    @State private var numberOfUnits = ""
    @State private var longDescription = ""
    @FocusState private var isFocused: Bool

    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading){
                    AppBarView( title: "Add Propetery", isBackButton: true)
                    
                    Divider()
                        .background(.gray50)
                    
                    HeadingText("General Details", fontSize: 15)
                        .padding(.top, 24)
                    Divider()
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                    //                    firstName
                    VStack(alignment: .leading) {
                        HeadingText("First Name", fontSize: 15)
                            .padding(.bottom, 12)
                        TextField("e.g. Sunset Heights Apartments", text: $firstName)
                            .foregroundStyle(.gray600)
                            .font(.system(size: 15))
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray300)
                            )
                        
                            .onSubmit {
                                print(firstName)
                            }
                            .focused($isFocused)
                            .onAppear{
                                isFocused = true
                            }
                            .colorScheme(.light)
                    }
                    
                    //                    full address
                    VStack(alignment: .leading) {
                        HeadingText("Full Address", fontSize: 15)
                            .padding(.bottom, 12)
                        TextField("Search for address...", text: $fullAddress)
                            .foregroundStyle(.gray600)
                            .font(.system(size: 15))
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray300)
                            )
                            .onSubmit {
                                print(firstName)
                            }
                            .focused($isFocused)
                            .onAppear{
                                isFocused = true
                            }
                            .colorScheme(.light)
                    }
                    .padding(.top, 12)
                    
                    HStack(spacing: 12){
                        //                    category
                        VStack(alignment: .leading) {
                            HeadingText("Category", fontSize: 15)
                                .padding(.bottom, 12)
                            TextField("Apartment", text: $category)
                                .foregroundStyle(.gray600)
                                .font(.system(size: 15))
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.gray300)
                                )
                            
                                .onSubmit {
                                    print(firstName)
                                }
                                .focused($isFocused)
                                .onAppear{
                                    isFocused = true
                                }
                                .colorScheme(.light)
                        }
                        
                        //                    Number of Units
                        VStack(alignment: .leading) {
                            HeadingText("Number of Units", fontSize: 15)
                                .padding(.bottom, 12)
                            TextField("1", text: $numberOfUnits)
                                .foregroundStyle(.gray600)
                                .font(.system(size: 15))
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.gray300)
                                )
                                .keyboardType(.numberPad)
                            
                                .onSubmit {
                                    print(firstName)
                                }
                                .focused($isFocused)
                                .onAppear{
                                    isFocused = true
                                }
                                .colorScheme(.light)
                        }
                    }
                    .padding(.top, 12)
                    
                    VStack(alignment: .leading){
                        HeadingText("Property Vision", fontSize: 15)
                        Divider()
                            .padding(.top, 8)
                            .padding(.bottom, 12)
                        
                        HeadingText("Briefly describe the unique selling points of this property for potential tenants.", fontSize: 13, fontWeight: .regular, color: .gray600)
                            .padding(.bottom, 12)
                        
                        TextField("Modern living with a touch of elegance...", text: $longDescription, axis: .vertical)
                            .frame(height: 100, alignment: .top)
                            .foregroundStyle(.gray600)
                            .font(.system(size: 13))
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray300)
                            )
                            .keyboardType(.numberPad)
                        
                            .onSubmit {
                                print(firstName)
                            }
                            .focused($isFocused)
                            .onAppear{
                                isFocused = true
                                
                            }
                            .colorScheme(.light)
                        
                        AddPropertyAmenities()
                            .padding(.top, 12)
                        
                        HeroImageView()
                        
                        VStack(spacing: 8){
                            Button(action: {}){
                                PrimaryButton(title: "Save & Publish", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                            }
                            Button(action: {}){
                                PrimaryButton(title: "Save as draft", isBackgroundColor: false, isBorder: true, titleColor: .primaryButton, backgroundColor: .gray50)
                            }
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 24)
                        
                        
                    }.padding(.top, 24)
                    
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .navigationBarBackButtonHidden(true)
            .background(.gray50)
            
        }
        
    }
}

#Preview {
    AddPropertyView()
}
