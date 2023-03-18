//
//  SaleCell.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct SaleCell: View {
    
    var category = ""
    var name = ""
    var price: Double = 0
    var discount = 0
    var imageURL = ""
    
    
    var body: some View {
        
        VStack{
            
            HStack(alignment: .bottom){
                Spacer()
                Text("\(discount)% off ")
                    .padding(5)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(15)
            }
            .padding(5)
            Spacer()
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text("\(category)")
                        .padding(6)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(15)
                    Text("\(name)")
                        .frame(height: 60)
                        .foregroundColor(.black)
                        .lineLimit(2)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("$ \(price, specifier: "%.2f")")
                        .foregroundColor(.black)
                }
                Spacer()
                HStack{
                    Image(systemName: "heart")
                        .padding(5)
                        .foregroundColor(Color("saleCirleElement"))
                        .background(Color("saleCircle"))
                        .clipShape(Circle())
                    
                    Image(systemName: "plus")
                        .padding(7)
                        .foregroundColor(Color("saleCirleElement"))
                        .background(Color("saleCircle"))
                        .clipShape(Circle())
                }
            }
            .padding(4)
        }
        .padding()
        .frame(width: screen.width * 0.7, height: screen.height * 0.25)
        .background(AsyncImage(url: URL(string: imageURL)){ image in
            image.resizable().aspectRatio(contentMode: .fill).clipped()
        } placeholder: {
            ProgressView()
        })
//        .aspectRatio(contentMode: .fill)
        .cornerRadius(25)
        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
        .padding(7)
    }
}

struct SaleCell_Previews: PreviewProvider {
    static var previews: some View {
        SaleCell()
    }
}




