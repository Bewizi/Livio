//
//  WelcomeScreen.swift
//  Livio
//
//  Created by Toluwalase on 06/08/2026.
//

import SwiftUI

struct WelcomeScreen: View {
    @State var currentPage: Int = 0
    
    func createAccount() {}
    func login() {}
    
    var body: some View {
        TabView(selection: $currentPage){
            OnboardingView(
                image: .onboarding1,
                createAccount: createAccount,
                login: login,
                title: Text("Manage Properties with \(Text("Ease").italic())"),
                subTitle: "Keep track of tenants, rent payments, leases, and property performance from a single dashboard.",
                currentPage: currentPage,
                pageIndex: 0
                
            )
            .tag(0)
            
            OnboardingView(
                image: .onboarding2,
                createAccount: createAccount,
                login: login,
                title: Text("A \(Text("Better").italic()) Way To Pay Rent"),
                subTitle: "Keep track of tenants, rent payments, leases, and property performance from a single dashboard.",
                currentPage: currentPage,
                pageIndex: 1
            )
            .tag(1)
            
            OnboardingView(
                image: .onboarding3,
                createAccount: createAccount,
                login: login,
                title: Text("Stay Connected & In \(Text("Control").italic())"),
                subTitle: "Keep track of tenants, rent payments, leases, and property performance from a single dashboard.",
                currentPage: currentPage,
                pageIndex: 2
            )
            .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
            
        
        
        
        
        
    }
}

#Preview {
    WelcomeScreen()
}

struct OnboardingView: View {
    let image: ImageResource
    let createAccount: () -> Void
    let login: () -> Void
    let title: Text
    let subTitle: String
    
    let currentPage: Int
    let pageIndex: Int
    
    var body: some View {
        
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                    .padding(.bottom, 17)

                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
                        Capsule()
                            .fill(index == currentPage ? .primaryButton : .gray)
                            .frame(width: 100, height: 10)
                            .animation(.easeInOut(duration: 0.25), value: currentPage)
                    }
                }
                .padding(.bottom, 41)

                Text("\(title)")
                    .font(.system(size: 29, weight: .medium))
                    .foregroundStyle(.onyx500)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 4)
            

                Text(subTitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.greu600)
                    .padding(.bottom, 41)
                    .lineHeight(.leading(increase: 8))

                VStack {
                    PrimaryButton(createAccount: createAccount, title: "Create an account", isBackgroundColor: true, isBorder: false, titleColor: .white)
                        .padding(.bottom, 8)

                    PrimaryButton(
                        createAccount: login,
                        title: "Login",
                        isBackgroundColor: false,
                        isBorder: true,
                        titleColor: .primaryButton
                    )
                }

                Spacer()
            }
            .padding(.horizontal, 20)
            .ignoresSafeArea()
            .background(
                .gray50
            )
        
    }
}

