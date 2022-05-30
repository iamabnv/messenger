//
//  User_Repository.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/23/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
 
class UserAuth_Repository : ObservableObject {
    
    static func signUp(newUser: User, password: String) async -> String {
        let db = Firestore.firestore()
        var id: String = ""
        
        let newUserRef = db.collection("User_Auth").document()
        
        id = newUserRef.documentID
        
        do {
            try newUserRef.setData(from: AuthUser(newID: id, newUsername: newUser.username, newPassword: password))
            
            try db.collection("Users").document(id).setData(from: newUser)
            
        } catch {
            print(error)
            id = ""
        }
        
        return id
    }
    
    static func signIn(username: String, password: String) async -> String {
        let db = Firestore.firestore()
        var id : String = ""
        
        do
        {
            let snapshot = try await db.collection("User_Auth").whereField("username", isEqualTo: username).getDocuments()
            
            snapshot.documents.forEach { doc in
                do {
                    let user = try doc.data(as: AuthUser.self)
                    if self.signInHelper(user: user, pwd: password) {
                        id = user.id!
                    }
                    else {
                        id = ""
                    }
                }
                catch {
                    print(error)
                }
            }
            
        }
        catch {
            print(error)
        }
        return id
    }
    
    private static func signInHelper(user: AuthUser, pwd: String) -> Bool {
        if pwd.compare(user.password).rawValue == 0 {
            return true
        }
        return false
    }
}
