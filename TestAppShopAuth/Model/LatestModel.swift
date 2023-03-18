//
//  LatestModel.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import Foundation

struct LatestModel: Codable{

    let latest: [Latest]
    
    enum CodingKeys: String, CodingKey {
        case latest
    }
}



struct Latest: Identifiable, Codable {
    let id = UUID()
    let category, name: String
    let price: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
