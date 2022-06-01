//
//  BaseView.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/31/22.
//

import SwiftUI

struct BaseView: View {
    
    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Chats", systemImage: "message")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
