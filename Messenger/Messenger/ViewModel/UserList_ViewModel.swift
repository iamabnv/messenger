//
//  User_ViewModel.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/23/22.
//

import Foundation
import Combine

class UserListVM: ObservableObject {
    
    @Published var repository: UserList_Repository = UserList_Repository()
    
    @Published var userItems: [UserItemVM] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        repository.$Users.map { users in
            users.map(UserItemVM.init)
        }
        .assign(to: \.userItems, on: self)
        .store(in: &cancellables)
    }
    
    init(data: Bool) {
        let user = User(First_name: "Abhinav", Last_name: "Srivastava", Username: "abnv")
            
        let userListItem = UserItemVM(data: user)
                
        let user2 = User(First_name: "Abhinav", Last_name: "Srivastava", Username: "abnv")
        
        let userListItem2 = UserItemVM(data: user2)
        
        userItems.append(userListItem)
        userItems.append(userListItem2)
    }
}
