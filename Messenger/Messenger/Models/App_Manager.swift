//
//  App_Manager.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/23/22.
//

import Foundation
import Combine

class appManager: ObservableObject {
    @Published var loggedInID: String = ""
}
