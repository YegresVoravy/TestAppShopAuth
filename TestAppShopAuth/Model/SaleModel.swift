//
//  SaleModel.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import Foundation


struct SaleModel: Codable{
    
    let flashSale: [FlashSale]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}


struct FlashSale: Identifiable, Codable {
    let id = UUID()
    let category, name: String
    let price: Double
    let discount: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}

