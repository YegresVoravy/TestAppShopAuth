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
        VStack(spacing: 15){
                Text("Profile")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top)
                if vm.loadedImage != nil {
                    vm.loadedImage?.image
                        .resizable().aspectRatio(contentMode: .fill).clipped()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                    


                } else{
                    Image("avatar")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                }
                
                    
                PhotosPicker(selection: $vm.selectedPhoto, matching: .any(of: [.images]), photoLibrary: .shared()) {
                        Text("Change photo")
                        .foregroundColor(Color.profile)
                    }

                
                Text("Satria Adhi Pradana")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(7)
                Button {
                    
                } label: {
                    Text("Upload item")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .font(.system(size: 15, weight: .bold))
                .background(Color.menuBlue)
                .cornerRadius(15)
                .padding(.horizontal, 25)
                .overlay {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(x: -100)
                }
            VStack(spacing: 15){
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color.profile.opacity(0.5))
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
                                .background(Color.profile.opacity(0.5))
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
                                .background(Color.profile.opacity(0.5))
                                .clipShape(Circle())
                            Text("Balance")
                            Spacer()
                            Text("$ 1593")
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                                .padding(10)
                                .background(Color.profile.opacity(0.5))
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
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .padding(10)
                                .background(Color.profile.opacity(0.5))
                                .clipShape(Circle())
                            Text("Restore Puurchase")
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
                                .background(Color.profile.opacity(0.5))
                                .clipShape(Circle())
                            Text("Help")
                            Spacer()
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
                                .background(Color.profile.opacity(0.5))
                                .clipShape(Circle())
                            Text("Log out")
                            Spacer()
                            
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
            .preferredColorScheme(.light)
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
