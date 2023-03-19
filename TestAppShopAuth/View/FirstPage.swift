//
//  FirstPage.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct FirstPage: View {
    
    @StateObject var vm = MainPageViewModel()
    
    var body: some View {
            ScrollView{
                VStack{
                    if !vm.isSearching{
                    HStack{
                        Image(systemName: "text.justify")
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                        Text("Trade by")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.black)
                        Text("bata")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("blue"))
                        Spacer()
                        VStack{
                            Image(systemName: "person.badge.plus")
                                .foregroundColor(Color("profile"))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(1)
                                .background(Color("profile"))
                                .clipShape(Circle())
                            
                            
                            HStack{
                                Text("Navigation")
                                    .font(.system(size: 12))
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    .padding()
                }
                        HStack{
                            ZStack(alignment: .trailing){
                                TextField(!vm.isSearching ? "What are you looking for?" : "", text: $vm.seachTF)
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                    .multilineTextAlignment(.center)
                                    .background(Color("authTF"))
                                    .cornerRadius(20)
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
//                                    .padding(.trailing, 17)
                                    .offset(x: -20)
                            }
                            if vm.isSearching{
                                Button {
                                    withAnimation {
                                        vm.isSearching.toggle()
                                    }
                                } label: {
                                    Image(systemName: "multiply")
                                        .foregroundColor(.red)
                                        .font(.system(size: 25, weight: .semibold))
                                }
                                .padding(8)
                                
                            }
                        }
                        .padding(.horizontal, 20)
                        .onTapGesture {
                            if !vm.isSearching{
                                withAnimation{
                                    
                                    vm.isSearching.toggle()
                                }
                            }
                        }
                    
                    if vm.isSearching{
                        ScrollView(.vertical, showsIndicators: false){
                            ForEach(vm.filteredSearchList, id: \.self){ item in
                                Button {
                                    
                                } label: {
                                    HStack{
                                        Text("\(item)")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    
                    if !vm.isSearching{
                        CathegoriesCells()
                        
                        HStack{
                            Text("Latest")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("View all")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 15))
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(vm.latest){ item in
                                    LatesCell(imageURL: URL(string: item.imageURL), title: item.name, price: item.price, cathegory: item.category)
                                }
                            }
                        }
                        
                        HStack{
                            Text("Flash sale")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("View all")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 15))
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(vm.flashSales){ item in
                                    SaleCell(category: item.category, name: item.name, price: item.price, discount: item.discount, imageURL: item.imageURL)
                                }
                            }
                            .onTapGesture {
                                vm.goToSecView.toggle()
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .preferredColorScheme(.light)
            .scrollDisabled(vm.isSearching)
            .fullScreenCover(isPresented: $vm.goToSecView) {
                SecondPage()
            }

    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
