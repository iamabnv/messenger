//
//  LoginView.swift
//  Messenger
//
//  Created by Abhinav Srivastava on 5/20/22.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var switchToList = false
    
    var body: some View {
        
        return Group {
            if switchToList {
                BaseView()
            }
            else  {
                loginViewForm(switchToList: $switchToList)
            }
        }
    }
    
    struct loginViewForm: View {
        
        @State var username: String = ""
        
        @State var password: String = ""
        
        @State var showAlert: Bool = false
        
        @State var showSheet: Bool = false
        
        @State var sheetPassword: String = ""
        
        @State var addAlert: Bool = false
        
        @State var newUser: User = User()
        
        @Binding var switchToList: Bool
        
        let app_manager = appManager.app_manager
        
        var body: some View {
            VStack(spacing: 0) {
                Color(uiColor: .systemGroupedBackground)
                
                Form {
                        TextField("Username", text: $username)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        TextField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        HStack
                        {
                            Spacer()
                            
                            Button("Sign In") {
                                Task {
                                    let id = await UserAuth_Repository.signIn(username: username, password: password)
                                    if id == "" {
                                        showAlert = true
                                    }
                                    else {
                                        app_manager.loggedInID = id
                                        switchToList = true
                                    }
                                }
                            }
                            .alert(isPresented: $showAlert) {
                                Alert (
                                    title: Text("Error"),
                                    message: Text("Invalid credentials")
                                )
                            }
                            Spacer()
                        }
                    HStack {
                        Spacer()
                        Button(action: {
                            showSheet.toggle()
                        }) {
                            Text("Sign Up")
                        }
                        .sheet(isPresented: $showSheet) {
                            NavigationView {
                                Form {
                                    Section("Name") {
                                        TextField("First Name", text: $newUser.first_name)
                                            .disableAutocorrection(true)
                                        TextField("Last Name", text: $newUser.last_name)
                                            .disableAutocorrection(true)
                                    }
                                    Section("Credentials") {
                                        TextField("Username", text: $newUser.username)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                        TextField("Password", text: $sheetPassword)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                    Section {
                                        Button(action: signUp) {
                                            HStack {
                                                Spacer()
                                                Text("Sign Up")
                                                Spacer()
                                            }
                                        }
                                        .alert(isPresented: $addAlert) {
                                            Alert (
                                                title: Text("Error"),
                                                message: Text("Failed add")
                                            )
                                        }
                                    }
                                }
                                .navigationTitle(Text("New User"))
                            }
                        }
                        Spacer()
                    }
                }
                Color(uiColor: .systemGroupedBackground)
            }
            .ignoresSafeArea()
        }
        
        func signUp() {
            Task {
                let id = await UserAuth_Repository.signUp(newUser: newUser, password: sheetPassword)
                
                if id == "" {
                    addAlert = true
                }
                else {
                    app_manager.loggedInID = id
                    showSheet.toggle()
                    switchToList = true
                }
            }
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
