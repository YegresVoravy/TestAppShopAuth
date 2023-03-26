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
                            .font(.system(size: 25, weight: .bold))
                        Spacer()
                        Text("Trade by")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.black)
                        Text("bata")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color.menuBlue)
                        Spacer()
                        VStack{
                            Spacer()
                            Image("avatar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(15)
                            
                            
                            HStack{
                                Text("Location")
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 8))
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
                                    .frame(height: 30)
                                    .multilineTextAlignment(.center)
                                    .background(Color.searchTF)
                                    .cornerRadius(20)
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .offset(x: -10)
                            }
                            .padding(.horizontal, 35)
                            if vm.isSearching{
                                Button {
                                    withAnimation {
                                        vm.isSearching.toggle()
                                        vm.seachTF = ""
                                        UIApplication.shared.keyWindow?.endEditing(true)
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
                                .font(.system(size: 15, weight: .bold))
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
                                .font(.system(size: 15, weight: .bold))
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
                                    FlashSaleCell(category: item.category, name: item.name, price: item.price, discount: item.discount, imageURL: item.imageURL)
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
