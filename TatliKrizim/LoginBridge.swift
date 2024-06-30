//
//  LoginBridge.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 19.05.2024.
//

import SwiftUI
import FirebaseAuth

struct LoginBridge: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        if userID == "" {
            ContentView()
        } else {
            Text("Logged in \nYour user id is: \(userID)")
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    withAnimation {
                        userID = ""
                    }
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }) {
                Text("Çıkış Yap")
            }
            
        }
 
    }
}

#Preview {
    LoginBridge()
}
