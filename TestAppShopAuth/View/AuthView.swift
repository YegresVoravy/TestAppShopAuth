//
//  AuthView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 10.03.2023.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var vm = AuthViewModel()
    
    @State var regOrLOgin = true
    @State var goToTab = false
    @State var loginAlert = false
    @State var signInAlert = false
    @State var isSecurePassword = false
    
    var body: some View {
        VStack{
            if regOrLOgin{
                VStack{
                    Text("Sign in")
                        .font(.title.bold())
                        .foregroundColor(.black)
                        .padding(.vertical, 60)
                    TextField("First name", text: $vm.firstName)
                        .keyboardType(.default)
                        .autocorrectionDisabled(true)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .multilineTextAlignment(.center)
                        .background(Color.authTF)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                    
                    TextField("Last name", text: $vm.lastName)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .multilineTextAlignment(.center)
                        .background(Color.authTF)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                    
                    TextField("Email", text: $vm.eMail)
                        .keyboardType(.emailAddress)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .multilineTextAlignment(.center)
                        .background(Color.authTF)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    
                    Text("\(vm.badEmailMessage)")
                        .foregroundColor(Color.red)
                        .padding(.bottom ,10)
                    Button {
                        if vm.canSignIn{
                            vm.addUser(firstName: vm.firstName, lastName: vm.lastName, eMail: vm.eMail)
                            vm.firstName = ""
                            vm.lastName = ""
                            vm.eMail = ""
                            goToTab.toggle()
                        } else {
                            vm.firstName = ""
                            vm.lastName = ""
                            vm.eMail = ""
                            signInAlert.toggle()
                        }
                    } label: {
                        Text("Sign in")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.menuBlue)
                    .cornerRadius(17)
                    .padding(15)
                    .disabled(!vm.badEmail)
                    
                    
                    
                    HStack{
                        Text("Already have an account?")
                            .foregroundColor(Color.gray)
                        Button {
                            regOrLOgin.toggle()
                        } label: {
                            Text("Log in")
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .font(.system(size: 13))
                    VStack(alignment: .leading){
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Sign in with Google")
                        }
                        .padding(.top)
                        HStack{
                            Image("apple")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Sign in with Apple")
                        }
                        .padding(.top)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                .alert(isPresented: $signInAlert, content: {
                    Alert(title: Text("Ошибка!"), message: Text("Пользователь с такими данными уже зарегистрирован!"), dismissButton: .default(Text("Ok")))
                })
                
            }else{
                VStack{
                    Text("Welcome back")
                        .font(.title.bold())
                        .foregroundColor(.black)
                        .padding(.vertical, 70)
                    TextField("First name", text: $vm.login)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .multilineTextAlignment(.center)
                        .background(Color.authTF)
                        .cornerRadius(20)
                        .padding(20)
                    
                    ZStack(alignment: .trailing){
                        if isSecurePassword{
                            TextField("Password", text: $vm.password)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .multilineTextAlignment(.center)
                                .background(Color.authTF)
                                .cornerRadius(20)
                                .padding(20)
                            Button {
                                isSecurePassword.toggle()
                            } label: {
                                Image(systemName: "eye")
                                    .foregroundColor(Color.gray)
                                    .padding(.trailing, 30)
                            }
                            .padding(10)
                        } else {
                            SecureField("Password", text: $vm.password)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .multilineTextAlignment(.center)
                                .background(Color.authTF)
                                .cornerRadius(20)
                                .padding(20)
                            Button {
                                isSecurePassword.toggle()
                            } label: {
                                Image(systemName: "eye.slash")
                                    .foregroundColor(Color.gray)
                                    .padding(.trailing, 30)
                            }
                            .padding(10)
                        }
                        
                    }
                    .padding(.bottom, 25)
                    
                    Button {
                        if vm.canLogin {
                            goToTab.toggle()
                        } else {
                            loginAlert.toggle()
                        }
                        vm.login = ""
                        vm.password = ""
                        isSecurePassword = false
                    } label: {
                        Text("Login")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.menuBlue)
                    .cornerRadius(17)
                    .padding(20)
                    Button {
                        regOrLOgin.toggle()
                    } label: {
                        Text("Sign in")
                    }
                    Spacer()
                }
                .alert(isPresented: $loginAlert, content: {
                    Alert(title: Text("Ошибка!"), message: Text("Логин или пароль введены не верно."), dismissButton: .default(Text("Ok")))
                })
            }
        }
        .padding()
        .onTapGesture {
            UIApplication.shared.keyWindow?.endEditing(true)
        }
        .fullScreenCover(isPresented: $goToTab) {
            TabBarView()
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
