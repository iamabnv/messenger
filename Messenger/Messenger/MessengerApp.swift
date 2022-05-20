//
//  MessengerApp.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/20/22.
//

import SwiftUI
import FirebaseCore

@main
struct MessengerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
