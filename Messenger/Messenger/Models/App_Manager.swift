//
//  App_Manager.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/23/22.
//

import Foundation
import Combine

class appManager: ObservableObject {
    
    static let app_manager = appManager()
    
    @Published var loggedInID: String = ""
}
