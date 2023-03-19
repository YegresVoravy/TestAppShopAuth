//
//  AuthView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 10.03.2023.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var vm = AuthViewModel()
    
    var body: some View {
        VStack{
            if vm.registration{
                
                Text("Sign in")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .padding(.vertical, 60)
                TextField("First name", text: $vm.firstName)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color("authTF"))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                
                TextField("Last name", text: $vm.lastName)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color("authTF"))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                
                TextField("Email", text: $vm.eMail)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color("authTF"))
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
                        vm.goToTab.toggle()
                    } else {
                        vm.firstName = ""
                        vm.lastName = ""
                        vm.eMail = ""
                        vm.signInAlert.toggle()
                    }
                } label: {
                    Text("Sign in")
                        .font(.system(size: 18, weight: .bold))
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("blue"))
                .cornerRadius(17)
                .padding(15)
                .disabled(!vm.badEmail)

                
                
                HStack{
                    Text("Already have an account?")
                        .foregroundColor(Color.gray)
                    Button {
                        vm.registration.toggle()
                    } label: {
                        Text("login")
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .font(.system(size: 13))
                
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
                .padding()
                Spacer()
            }else{
                Text("Welcome back!")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .padding(.vertical, 70)
                TextField("First name", text: $vm.login)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color("authTF"))
                    .cornerRadius(20)
                    .padding(20)
                
                ZStack(alignment: .trailing){
                    if vm.isSecurePassword{
                        TextField("Password", text: $vm.password)
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .multilineTextAlignment(.center)
                            .background(Color("authTF"))
                            .cornerRadius(20)
                            .padding(20)
                    } else {
                        SecureField("Password", text: $vm.password)
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .multilineTextAlignment(.center)
                            .background(Color("authTF"))
                            .cornerRadius(20)
                            .padding(20)
                    }
                    Button {
                        vm.isSecurePassword.toggle()
                    } label: {
                        Image(systemName: "eye.slash")
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 30)
                    }
                }
                .padding(.bottom, 25)
                
                Button {
                    if vm.canLogin {
                        vm.goToTab.toggle()
                        vm.login = ""
                        vm.password = ""
                    } else {
                        vm.loginAlert.toggle()
                        vm.login = ""
                        vm.password = ""
                    }
                } label: {
                    Text("Login")
                        .font(.system(size: 18, weight: .bold))
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("blue"))
                .cornerRadius(17)
                .padding(20)
                Button {
                    vm.registration.toggle()
                } label: {
                    Text("Sign in")
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $vm.loginAlert, content: {
            Alert(title: Text("Ошибка!"), message: Text("Логин или пароль введены не верно."), dismissButton: .default(Text("Ok")))
        })
        .alert(isPresented: $vm.signInAlert, content: {
            Alert(title: Text("Ошибка!"), message: Text("Пользователь с такими данными уже зарегистрирован!"), dismissButton: .default(Text("Ok")))
        })
        .fullScreenCover(isPresented: $vm.goToTab) {
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
