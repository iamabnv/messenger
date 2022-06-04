//
//  UserListItemView.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 6/1/22.
//

import SwiftUI

struct UserListItemView: View {
    
    var userItemVM: UserItemVM
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .data(url: URL(string: userItemVM.user.pfp)!)
                .frame(width: 40, height: 40)
                .padding(.trailing, 5)
                .clipShape(Circle())
            Text("\(userItemVM.user.first_name) \(userItemVM.user.last_name)")
        }
    }
}

struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserListItemView(userItemVM: UserItemVM(data: User()))
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
