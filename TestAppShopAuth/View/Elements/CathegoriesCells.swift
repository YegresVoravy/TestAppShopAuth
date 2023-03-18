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
                                .foregroundColor(Color("cathegory"))
                            Image(systemName: "iphone")
                                .foregroundColor(.black)
                        }
                        Text("Phones")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    VStack{
                        ZStack{
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("cathegory"))
                            Image(systemName: "headphones")
                                .foregroundColor(.black)
                        }
                        Text("Headphones")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    VStack{
                        ZStack{
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("cathegory"))
                            Image(systemName: "gamecontroller")
                                .foregroundColor(.black)
                        }
                        Text("Games")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    VStack{
                        ZStack{
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("cathegory"))
                            Image(systemName: "car.side")
                                .foregroundColor(.black)
                        }
                        Text("Cars")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    VStack{
                        ZStack{
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("cathegory"))
                            Image(systemName: "bed.double")
                                .foregroundColor(.black)
                        }
                        Text("Furniture")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    VStack{
                        ZStack{
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("cathegory"))
                            Image(systemName: "face.smiling")
                                .foregroundColor(.black)
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
