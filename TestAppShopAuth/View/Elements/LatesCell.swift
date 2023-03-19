//
//  LatesCell.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct LatesCell: View {
    
    var imageURL = URL(string: "")
    var title = ""
    var price = 0
    var cathegory = ""
    
    
    var body: some View {
        
//        ZStack(alignment: .bottom){
//            AsyncImage(url: imageURL){ image in
//                image.resizable()
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: screen.width * 0.5, height: screen.height * 0.28)
//            .background(Color.red)
//            .cornerRadius(25)
//            .shadow(color: .gray, radius: 5, x: 0, y: 0)
//            .padding(10)
//
//            HStack(alignment: .bottom){
//                VStack(alignment: .leading){
//                    Text("\(cathegory)")
//                        .padding(5)
//                        .font(.system(size: 10, weight: .semibold))
//                        .background(Color.gray.opacity(0.6))
//                        .cornerRadius(20)
//                    Text("\(title)")
//                        .lineLimit(2)
//                        .foregroundColor(.black)
//                        .font(.system(size: 15, weight: .semibold))
//                        .padding(.bottom, 7)
//                    Text("\(price)")
//                        .foregroundColor(.black)
//                        .font(.system(size: 10))
//                }
//                .padding()
//
//                Spacer()
//                Image(systemName: "plus")
//                    .padding(7)
//                    .background(Color("cathegory"))
//                    .clipShape(Circle())
//                    .padding()
//            }
//            .background(Color.green)
//            .padding()
        VStack{
            Spacer()
            HStack(alignment: .bottom){
                                VStack(alignment: .leading){
                                    Text("\(cathegory)")
                                        .padding(5)
                                        .font(.system(size: 6, weight: .semibold))
                                        .foregroundColor(.white).shadow(color: .black, radius: 1)
                                        .background(Color.gray.opacity(0.6))
                                        .cornerRadius(20)
                                    Text("\(title)")
                                        .frame(height: 20)
                                        .foregroundColor(.white).shadow(color: .black, radius: 1)
                                        .lineLimit(2)
                                        .font(.system(size: 10, weight: .semibold))
//                                        .padding(.bottom, 7)
                                    Text("$ \(price)")
                                        .foregroundColor(.white).shadow(color: .black, radius: 1)
                                        .font(.system(size: 8))
                                        .padding(.top, 5)
                }
                Spacer()
                                Image(systemName: "plus")
                                    .padding(3)
                                    .font(.system(size: 8))
                                    .background(Color("cathegory"))
                                    .clipShape(Circle())
                                
            }
            .padding(7)
            .padding(.bottom, 4)
            .background(Color.black.opacity(0.3)) //Белый текст на белом фоне не видно было
        
        
        }
                    .frame(width: screen.width * 0.3, height: screen.height * 0.18)
                    .background(AsyncImage(url: imageURL){ image in
                        image.resizable().aspectRatio(contentMode: .fill).clipped()
                                    } placeholder: {
                                        ProgressView()
                                    })
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
                    .padding(7)
    }
}

struct LatesCell_Previews: PreviewProvider {
    static var previews: some View {
        LatesCell()
    }
}
