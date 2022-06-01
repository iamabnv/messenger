//
//  UserList.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/27/22.
//

import SwiftUI

struct UserListView: View {
    
    let app_manager = appManager.app_manager
    
    @ObservedObject var userListVM = UserListVM()

    var body: some View {
        NavigationView {
            List {
                Section {
                    
                }
                ForEach(userListVM.userItems) {item in
                    Section {
                        NavigationLink {
                            ChatView(id: item.user)
                        } label: {
                            UserListItemView(userItemVM: item)
                                .frame(height: 50)
                        }
                    }
                    
                    /*NavigationLink {
                        ChatView(id: item.user)
                    } label: {
                        UserListItemView(userItemVM: item)
                                .frame(height: 50)
                    }*/
                }
            }
            .navigationTitle(Text("Chats"))
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(userListVM: UserListVM(data: true))
    }
}
