//
//  CathegoriesCells.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct CathegoriesCells: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15){
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.cathegory)
                        Image("phone")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    Text("Phones")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.cathegory)
                        Image("headPhones")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    Text("Headphones")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.cathegory)
                        Image("joystick")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    Text("Games")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.cathegory)
                        Image("car")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    Text("Cars")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.cathegory)
                        Image("furniture")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    Text("Furniture")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                VStack{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.cathegory)
                        Image("robot")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    }
                    Text("Kids")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
    }
}

struct CathegoriesCells_Previews: PreviewProvider {
    static var previews: some View {
        CathegoriesCells()
    }
}
