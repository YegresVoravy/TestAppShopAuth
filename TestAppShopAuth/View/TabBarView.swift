//
//  TabBarView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Tab = .house
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
                    switch selectedTab{
                    case .house:
                        FirstPage()
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
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
