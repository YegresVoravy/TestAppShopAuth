//
//  SecondPageViewController.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 18.03.2023.
//

import SwiftUI
import Combine


class SecondPageViewModel: ObservableObject{
    
    @Published var product: ProductModel?
    @Published var images: [String] = []
    @Published var mainImage: String  = ""
    @Published var count = 0
    
    var cancelables = Set<AnyCancellable>()
    
    init(){
        downloadProduct()
    }
    
    func downloadProduct(){
        guard let prodtUrl = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else {return}
        
        NetworkService.download(url: prodtUrl)
            .decode(type: ProductModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] returnedValue in
                self?.product = returnedValue
                self?.images = returnedValue.imageUrls
                self?.mainImage = returnedValue.imageUrls.first ?? ""
            })
            .store(in: &cancelables)
    }
    
}
