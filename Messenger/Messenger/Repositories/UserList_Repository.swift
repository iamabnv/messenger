//
//  UserList_Repository.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 6/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift
import Combine
import UIKit
import SwiftUI

class UserList_Repository: ObservableObject {
    private let db = Firestore.firestore()
    private let path = "Users"
    
    @Published var Users: [User] = []
    
    private let app_manager = appManager.app_manager
    
    init() {
        // call function get()
        get()
    }
    
    func get() {
        if app_manager.loggedInID != "" {
            db.collection(path)
                .whereField(FirebaseFirestore.FieldPath.documentID(), isNotEqualTo: app_manager.loggedInID)
                .addSnapshotListener { querySnapshot, error in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    self.Users = querySnapshot?.documents.compactMap({ QueryDocumentSnapshot in
                        
                        try? QueryDocumentSnapshot.data(as: User.self)
                    
                    }) ?? []
                }
        }
        else {
            self.Users = []
        }
       
    }
}
