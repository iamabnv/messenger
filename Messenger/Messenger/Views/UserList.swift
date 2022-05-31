//
//  UserList.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/27/22.
//

import SwiftUI

struct UserList: View {
    
    @EnvironmentObject var app_manager: appManager
    
    var body: some View {
        Text("Hello, \(app_manager.loggedInID)!")
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
            .environmentObject(appManager())
    }
}
