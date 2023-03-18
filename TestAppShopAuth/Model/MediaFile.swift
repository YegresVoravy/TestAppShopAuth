//
//  MediaFile.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 15.03.2023.
//

import SwiftUI


struct MediaFile: Identifiable{
    let id = UUID().uuidString
    let image: Image
    let data: Data
}
