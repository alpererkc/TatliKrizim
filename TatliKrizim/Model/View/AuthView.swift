//
//  AuthView.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 19.05.2024.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login" // login or signup
    
    var body: some View {
        
        if (currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing )
                .preferredColorScheme(.light)
        } else {
            SignUpView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
    }
}

#Preview {
    AuthView()
}
