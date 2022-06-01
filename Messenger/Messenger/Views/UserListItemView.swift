//
//  UserListItemView.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 6/1/22.
//

import SwiftUI

struct UserListItemView: View {
    
    var userItemVM: UserItemVM
    
    var body: some View {
        HStack {
            Text("\(userItemVM.user.first_name) \(userItemVM.user.last_name)")
        }
    }
}

struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserListItemView(userItemVM: UserItemVM(data: User()))
    }
}
