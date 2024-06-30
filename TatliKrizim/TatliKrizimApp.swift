//
//  TatliKrizimApp.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 30.03.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct TatliKrizimApp: App {
    @AppStorage("uid") var userID: String = ""

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if userID.isEmpty {
                AuthView()
            } else {
                ContentView()
            }
        }
    }
}
