//
//  ChatView.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 6/1/22.
//

import SwiftUI

struct ChatView: View {
    
    var id: User
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Hello, \(id.id!)!")
            .navigationTitle(Text(""))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                        }
                    }

                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 36, height: 36)
                        Text("\(id.first_name) \(id.last_name)")
                    }
                    .padding(15)
                }
            }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(id: User())
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
