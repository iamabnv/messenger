//
//  Model_User.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/23/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AuthUser : Codable, Identifiable {
    @DocumentID var id: String?
    var username: String
    var password: String
    
    init() {
        id = ""
        username = ""
        password = ""
    }
    
    init(newID: String, newUsername: String, newPassword: String) {
        id = newID
        username = newUsername
        password = newPassword
    }
}
