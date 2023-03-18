//
//  AuthViewController.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 10.03.2023.
//

import SwiftUI
import Combine
import CoreData

class AuthViewController: ObservableObject{
    
    @Published var savedUsers: [UserEntity] = []
    
    let container: NSPersistentContainer
    
    @Published var login = ""
    @Published private var loginIsValid = false
    @Published var password = ""
    @Published private var passIsValid = false
    @Published var canLogin = false
    @Published var loginAlert = false
    @Published var firstName = ""
    @Published var firstNameNotUsed = false
    @Published var lastName = ""
    @Published var lastNameNotUsed = false
    @Published var eMail = ""
    @Published private var eMailIsValid = false
    @Published var badEmail = false
    @Published var badEmailMessage = ""
    
    @Published var canSignIn = false
    @Published var validRegistration = false
    
    @Published var signInAlert = false

    @Published var registration = true
    
    @Published var isSecurePassword = false
    
    @Published var goToTab = false
    
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
        newUser.firstName = firstName
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
        $firstName
            .map{ value in
                if self.savedUsers.contains(where: {$0.firstName == value}) || value.isEmpty{
                    return false
                } else {
                    return true
                }
            }
            .assign(to: \.firstNameNotUsed, on: self)
            .store(in: &cancelables)
        $lastName
            .map{ value in
                if self.savedUsers.contains(where: {$0.lastName == value}) || value.isEmpty{
                    return false
                } else {
                    return true
                }
            }
            .assign(to: \.lastNameNotUsed, on: self)
            .store(in: &cancelables)
        $eMail
            .map{ value in
                if self.savedUsers.contains(where: {$0.eMail == value}) || value.isEmpty{
                    return false
                } else {
                    return true
                }
            }
            .assign(to: \.eMailIsValid, on: self)
            .store(in: &cancelables)
        
        Publishers.CombineLatest3($firstNameNotUsed, $lastNameNotUsed, $eMailIsValid)
            .map{first, last, email in
                return(first && last && email)
            }
            .assign(to: \.canSignIn, on: self)
            .store(in: &cancelables)
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
        $login
            .map{value -> Bool in
                if self.savedUsers.contains(where: {$0.firstName == value}){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.loginIsValid, on: self)
            .store(in: &cancelables)
        $password
            .map{value -> Bool in
                if self.savedUsers.contains(where: {$0.password == value}){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.passIsValid, on: self)
            .store(in: &cancelables)
        
        Publishers.CombineLatest($loginIsValid, $passIsValid)
            .map{ login, password in
                return (login && password)
            }
            .assign(to: \.canLogin, on: self)
            .store(in: &cancelables)
        
    }
    
}

