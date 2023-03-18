//
//  TabBarView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        TabView {
            
            FirstPage()
                .tabItem {
                    Image(systemName: "house")
                }
            LikeView()
                .tabItem {
                    Image(systemName: "heart")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                }
            MessagerView()
                .tabItem {
                    Image(systemName: "bubble.left")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
        .background(Color.white.opacity(0.5).ignoresSafeArea())

        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
