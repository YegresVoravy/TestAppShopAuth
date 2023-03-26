//
//  CustomTabBarView.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 25.03.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    Spacer()
                    ZStack{
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(selectedTab == tab ? Color.tabSelected : Color.clear)
                        Image(systemName: tab.rawValue)
                            .foregroundColor(selectedTab == tab ? .tabSelectedItem : .gray)
                    }
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(Color.white)
            .cornerRadius(30)
            .padding(10)
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(.house))
    }
}
