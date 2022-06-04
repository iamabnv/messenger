//
//  Model_User.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/28/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var first_name: String
    var last_name: String
    var username: String
    var pfp: String
    
    init() {
        id = ""
        first_name = ""
        last_name = ""
        username = ""
        pfp = ""
    }
    
    init(First_name: String, Last_name: String, Username: String) {
        first_name = First_name
        last_name = Last_name
        username = Username
        pfp = ""
    }
    
    init(First_name: String, Last_name: String, Username: String, Pfp: String) {
        first_name = First_name
        last_name = Last_name
        username = Username
        pfp = Pfp
    }
}
