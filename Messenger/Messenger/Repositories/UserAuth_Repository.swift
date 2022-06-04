//
//  User_Repository.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/23/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift
import UIKit
 
class UserAuth_Repository : ObservableObject {
    
    static func signUp(newUser: User, password: String, image: UIImage?) async -> String {
        let db = Firestore.firestore()
        var id: String = ""
        
        var pfp: String = ""
        
        let newUserRef = db.collection("User_Auth").document()
        
        id = newUserRef.documentID
        
        if image != nil {
            let storage = Storage.storage()
            let storageRef = storage.reference().child("Users/pfp/\(id).jpg")
            
            let resized_img = image!.jpegData(compressionQuality: 0.2)
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            
            do {
                _ = try await storageRef.putDataAsync(resized_img!, metadata: metadata)
                
                let url = try await storageRef.downloadURL()
                
                pfp = url.absoluteString
                
                try await newUserRef.setData(from: AuthUser(newID: id, newUsername: newUser.username, newPassword: password))
                
                let newNewUser = User(First_name: newUser.first_name, Last_name: newUser.last_name, Username: newUser.username, Pfp: pfp)
                
                try await db.collection("Users").document(id).setData(from: newNewUser)
                
            } catch {
                print(error)
            }
        }
        else {
            do {
                try await newUserRef.setData(from: AuthUser(newID: id, newUsername: newUser.username, newPassword: password))
                
                let newNewUser = User(First_name: newUser.first_name, Last_name: newUser.last_name, Username: newUser.username, Pfp: pfp)
                
                try await db.collection("Users").document(id).setData(from: newNewUser)
                
            } catch {
                print(error)
                id = ""
            }
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

extension FirebaseFirestore.DocumentReference {
    func setData<T: Encodable>(from: T, merge: Bool = false) async throws {
        let encoder = Firestore.Encoder()
        let data = try encoder.encode(from)
        try await setData(data, merge: merge)
    }
}
