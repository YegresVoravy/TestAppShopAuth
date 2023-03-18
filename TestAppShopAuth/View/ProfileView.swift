//
//  ProfileView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = MainPageViewModel()
    
    
    
    var body: some View {
            VStack{
                Text("Profile")
                    .font(.system(size: 20, weight: .bold))
                if vm.loadedImage != nil {
                    vm.loadedImage?.image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .padding(1)
                        .background(Color("profile"))
                        .clipShape(Circle())
                    


                } else{
                    Image(systemName: "person.badge.plus")
                        .foregroundColor(Color("profile"))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(1)
                        .background(Color("profile"))
                        .clipShape(Circle())
                }
                
                    
                PhotosPicker(selection: $vm.selectedPhoto, matching: .any(of: [.images]), photoLibrary: .shared()) {
                        Text("Change photo")
                            .foregroundColor(Color("profile"))
                    }

                
                Text("Фамилия Имя Отчество")
                    .font(.system(size: 20, weight: .semibold))
                    .padding()
                Button {
                    
                } label: {
                    Text("Upload item")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .font(.system(size: 15, weight: .bold))
                .background(Color("blue"))
                .cornerRadius(15)
                .padding(.horizontal, 25)
                .overlay {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(x: -100)
                }
                VStack{
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Trade store")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Payment method")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Trade store")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Trade history")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Trade store")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Restore purchase")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "questionmark.circle")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Help")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .padding(10)
                                .background(Color("profile").opacity(0.5))
                                .clipShape(Circle())
                            Text("Log out")
                            Spacer()
                            
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 20)
            }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
