//
//  UserItem_ViewModel.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 6/1/22.
//

import Foundation
import Combine

class UserItemVM: ObservableObject, Identifiable {
    
    var id = ""
    
    @Published var user: User
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(data: User) {
        self.user = data
        
        $user
            .compactMap { User in
                User.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
