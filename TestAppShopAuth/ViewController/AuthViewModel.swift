//
//  AuthViewController.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 10.03.2023.
//

import SwiftUI
import Combine
import CoreData

class AuthViewModel: ObservableObject{
    
    @Published var savedUsers: [UserEntity] = []
    
    let container: NSPersistentContainer
    
    @Published var login = ""
    @Published var password = ""
    @Published var canLogin = false
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var eMail = ""
    @Published var canSignIn = false
    @Published var badEmail = false
    @Published var badEmailMessage = ""
    
    private let emailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Ragex.email.rawValue)
    
    var cancelables = Set<AnyCancellable>()
    
    init(){
        
        container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        fetchUsers()
        emailCheck()
        signIn()
        logIn()
    }
    
    func fetchUsers(){
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do{
            savedUsers = try container.viewContext.fetch(request)
        } catch let error{
            print("error fetching \(error)")
        }
    }
    
    func addUser(firstName: String, lastName: String, eMail: String){
        let newUser = UserEntity(context: container.viewContext)
        
        if firstName.hasSuffix(" "){
            var fName = firstName
            fName.removeLast()
            newUser.firstName = fName
        } else {
            newUser.firstName = firstName
        }
        newUser.lastName = lastName
        newUser.eMail = eMail
        newUser.password = "12345678"
        saveData()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchUsers()
        } catch let error{
            print("Error saving \(error)")
        }
    }
    
    func signIn(){
        Publishers.CombineLatest3($firstName, $lastName, $eMail)
            .map{first, last, email in
                if (self.savedUsers.contains(where: {$0.firstName == first}) || first.isEmpty) && (self.savedUsers.contains(where: {$0.lastName == last}) || last.isEmpty) && (self.savedUsers.contains(where: {$0.eMail == email}) || email.isEmpty){
                    return false
                } else {
                    return true
                }
            }
            .assign(to: \.canSignIn, on: self)
            .store(in: &cancelables)
    }
    
    func emailCheck(){
        $eMail
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map{ value -> (Bool, String) in
                if self.emailPredicate.evaluate(with: value) || value.isEmpty{
                    return (true, " ")
                } else {
                    return (false, "Bad e-mail format")
                }
            }
            .sink {[weak self] (email, message) in
                self?.badEmail = email
                self?.badEmailMessage = message
            }
            .store(in: &cancelables)
    }
    
    func logIn(){
        Publishers.CombineLatest($login, $password)
            .map{ login, password in
                if self.savedUsers.contains(where: {$0.firstName == login}) && self.savedUsers.contains(where: {$0.password == password}){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.canLogin, on: self)
            .store(in: &cancelables)
    }
}




