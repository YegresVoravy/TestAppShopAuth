//
//  SaleCell.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI

struct FlashSaleCell: View {
    
    var category = ""
    var name = ""
    var price: Double = 0
    var discount = 0
    var imageURL = ""
    
    
    var body: some View {
        
        VStack{
            
            HStack(alignment: .bottom){
                Image("flashBage")
                Spacer()
                Text("\(discount)% off ")
                    .padding(5)
                    .padding(.horizontal, 5)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(20)
            }
            Spacer()
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text("\(category)")
                        .padding(6)
                        .padding(.horizontal, 5)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(10)
                    Text("\(name)")
                        .frame(height: 60)
                        .foregroundColor(.white).shadow(color: .black, radius: 1)
                        .lineLimit(2)
                        .font(.system(size: 15, weight: .semibold))
                    
                    Text("$ \(price, specifier: "%.2f")")
                        .font(.system(size: 10))
                        .foregroundColor(.white).shadow(color: .black, radius: 1)
                }
                Spacer()
                HStack{
                    Image(systemName: "heart")
                        .padding(5)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(Color.saleCirleElement)
                        .background(Color.saleCircle)
                        .clipShape(Circle())
                    
                    Image(systemName: "plus")
                        .padding(7)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.saleCirleElement)
                        .background(Color.saleCircle)
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 3)
        }
        .padding(8)
        .frame(width: screen.width * 0.45, height: screen.height * 0.3)
        .background(AsyncImage(url: URL(string: imageURL)){ image in
            image.resizable().aspectRatio(contentMode: .fill).clipped()
        } placeholder: {
            ProgressView()
        })
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
        .padding(7)
    }
}

struct SaleCell_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleCell()
    }
}




