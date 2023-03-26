//
//  TabBarView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Tab = .house
    @StateObject var vm = MainPageViewModel()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
                    switch selectedTab{
                    case .house:
                        FirstPage(vm: vm)
                    case .heart:
                        LikeView()
                    case .cart:
                        CartView()
                    case .bubble:
                        MessagerView()
                    case .person:
                        ProfileView()
                    }
            VStack{
                if !vm.isSearching{
                    Spacer()
                    CustomTabBarView(selectedTab: $selectedTab)
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
