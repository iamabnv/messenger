//
//  BaseTextField.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/28/22.
//

import SwiftUI

struct BaseTextField: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}
