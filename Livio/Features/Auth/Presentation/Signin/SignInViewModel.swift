//
//  SignInViewModel.swift
//  Livio
//
//  Created by Toluwalase on 13/08/2026.
//

import Foundation
internal import Combine

final class SignInViewModel: ObservableObject {
    @Published  var phoneNumber = ""
    @Published  var password = ""
    @Published  var selectedFlag: String = "🇳🇬"
    @Published  var selectedCode: String = "+234"
    @Published  var showPassword = false
    @Published  var showConfirmPassword = false
    @Published  var navigateToForgetPasswordView = false
    @Published  var navigateToCreateAccountView = false
    
    let flagCodePairs: [(flag: String, code: String)] = [("🇳🇬", "+234"), ("🇺🇸", "+1"), ("🇬🇧", "+44")]
    
    
}
