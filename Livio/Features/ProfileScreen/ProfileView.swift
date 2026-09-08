//
//  ProfileView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct ProfileView: View {
    @State private var isPushNotificationOn: Bool = true
    @State private var isEmailUpdatesOn: Bool = true
    @State private var isSmsAlertsOn: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack{
                    appBar
                    
                    Divider()
                        .background(.gray300)
                    
                    //                user info
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            //                        user image
                            HStack(alignment: . top) {
                                HStack(alignment: . top, spacing: 12) {
                                    Image("user")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .clipShape(Circle())
                                    VStack(alignment:.leading, spacing: 8){
                                        HeadingText("Chidera Nwachukwu", fontSize: 15)
                                        HeadingText("Property Manager", fontSize: 13, fontWeight: .regular, color: .gray600)
                                        HStack{
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 14))
                                                .foregroundStyle(.gray50)
                                            HeadingText("Verified Landlord", fontSize: 13, color: .gray50)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24)
                                                .fill(.success600.gradient)
                                        )
                                    }
                                }
                                Spacer()
                                Image(systemName: "square.and.pencil")
                            }
                            
                            Divider()
                                .padding(.vertical, 12)
                            
                            userUnits
                            
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.gray100)
                                .stroke(.gray300)
                        )
                        .padding(.bottom, 24)
                        
                        //                        account settings
                        VStack(alignment: .leading, spacing: 12){
                            HeadingText("Account Settings", fontSize: 15)
                            SettingsNavigationRow(title: "Change password")
                            SettingsNavigationRow(title: "Two-factor authentication", subtitle: "Disabled", subtitleColor: .error600)
                        }
                        .padding(.bottom, 24)
                        
                        //                        business information
                        VStack(alignment: .leading, spacing: 12){
                            HeadingText("Business Information", fontSize: 15)
                            SettingsNavigationRow(title: "Business Name", subtitle: "Rivers Properties LLC", subtitleColor: .gray600)
                            SettingsNavigationRow(title: "Tax ID Number", subtitle: "**-***4482", subtitleColor: .gray600)
                            SettingsNavigationRow(title: "Business Address", subtitle: "123 Maple St, Suite 400", subtitleColor: .gray600)
                        }
                        .padding(.bottom, 24)
                        
                        //                        notification preference
                        VStack(alignment: .leading, spacing: 12){
                            HeadingText("Notification Preferences", fontSize: 15)
                            SettingsToggleRow(title: "Push Notifications", isOn: $isPushNotificationOn)
                            SettingsToggleRow(title: "Email Updates", isOn: $isEmailUpdatesOn)
                            SettingsToggleRow(title: "SMS Alerts", isOn: $isSmsAlertsOn)
                        }
                        .padding(.bottom, 24)
                        
                        //                        App Preferences
                        VStack(alignment: .leading, spacing: 12){
                            HeadingText("App Preferences", fontSize: 15)
                            SettingsNavigationRow(title: "Language", subtitle: "English (UK)", subtitleColor: .gray600)
                            SettingsToggleRow(title: "Theme", isOn: $isSmsAlertsOn)
                        }
                        .padding(.bottom, 24)
                        
                        //                        Support & Legal
                        VStack(alignment: .leading, spacing: 12){
                            HeadingText("Support & Legal", fontSize: 15)
                            SettingsNavigationRow(title: "Help Center", subtitle: "English (UK)", subtitleColor: .gray600)
                            SettingsNavigationRow(title: "Privacy Policy", subtitle: "Dark Mode", subtitleColor: .gray600)
                            SettingsNavigationRow(title: "Privacy Policy", subtitle: "Dark Mode", subtitleColor: .gray600)
                            
                        }
                        
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray50)
                .safeAreaInset(edge: .bottom){}
            }
            .background(.gray50)
            
        }
    }
    
    private var appBar: some View {
        VStack{
            HeadingText("Settings", fontSize: 15)
        }
    }
    
    private var userUnits: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack{
                HStack{
                    Image("building-03")
                    HeadingText("98",fontSize: 15)
                    HeadingText("Properties", fontSize: 13, color: .gray600)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray300)
                )
                
                HStack{
                    Image("building-01")
                    HeadingText("120",fontSize: 15)
                    HeadingText("Units", fontSize: 13, color: .gray600)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray300)
                )
            }
            
            HStack{
                HStack{
                    Image("calendar-02")
                    HeadingText("Joined", fontSize: 13, color: .gray600)
                    HeadingText("2018",fontSize: 15)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray300)
                )
                
                HStack{
                    Image("checkmark-circle-02")
                    HeadingText("Active", fontSize: 13, color: .gray600)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray300)
                )
            }
            
            
        }
    }
    
}

#Preview {
    ProfileView()
}
