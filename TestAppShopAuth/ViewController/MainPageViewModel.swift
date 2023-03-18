//
//  MainPageViewController.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 11.03.2023.
//

import SwiftUI
import Combine
import PhotosUI

class MainPageViewModel: ObservableObject{
    
    @Published var flashSales: [FlashSale] = []
    @Published var latest: [Latest] = []
    @Published var searchList: [String] = []
    @Published var filteredSearchList: [String] = []
    
    @Published var name = "Load"
    
    @Published var seachTF = ""
    
    @Published var isSearching = false
    
    @Published var loadedImage: MediaFile?
    @Published var selectedPhoto: PhotosPickerItem?{
        didSet{
            if let selectedPhoto{
                processPhoto(photo: selectedPhoto)
            }
        }
    }
    
    var cancelables = Set<AnyCancellable>()
    
    
    init(){
        
            downloadProducts()
        addSubscribers()
    }
    
    
    func downloadProducts(){
        downloadSale()
        downloadLatest()
        downloadSearchList()
    }
    
    func downloadSale(){
        guard let flashSalesUrl = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {return}
        
        NetworkService.download(url: flashSalesUrl)
            .decode(type: SaleModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] returnedValue in
                self?.flashSales = returnedValue.flashSale
            })
            .store(in: &cancelables)
    }
    
    func downloadSearchList(){
        guard let searchUrl = URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19") else {return}
        
        NetworkService.download(url: searchUrl)
            .decode(type: SearchModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] returnedValue in
                self?.searchList = returnedValue.words
            })
            .store(in: &cancelables)
    }
    
    
    func downloadLatest(){
        guard let latestUrl = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {return}
        
        NetworkService.download(url: latestUrl)
            .decode(type: LatestModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] returnedValue in
                self?.latest = returnedValue.latest
            })
            .store(in: &cancelables)
    }
    
    
    func processPhoto(photo: PhotosPickerItem){
        photo.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let data):
                    if let data, let image = UIImage(data: data){
                        self.loadedImage = MediaFile(image: Image(uiImage: image), data: data)
                    }
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    func addSubscribers() {
    
        $seachTF
            .combineLatest($searchList)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterWords)
            .sink { [weak self] returnedCoins in
                self?.filteredSearchList = returnedCoins
            }
            .store(in: &cancelables)
    
    }
    
    private func filterWords(text: String, words: [String]) -> [String]{
    
        guard !seachTF.isEmpty else {
            return words
        }
    
        let lowerCasedText = text.lowercased()
       return words.filter { word in
            return word.lowercased().contains(lowerCasedText)
        }
    }
    
    
    
}


//func addSubscribers() {
//
//    $searchText
//        .combineLatest(dataService.$allCoins)
//        .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//        .map(filterCoins)
//        .sink { [weak self] returnedCoins in
//            self?.allCoins = returnedCoins
//        }
//        .store(in: &cancelables)
//
//}
//
//private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel]{
//
//    guard !text.isEmpty else {
//        return coins
//    }
//
//    let lowerCasedText = text.lowercased()
//   return coins.filter { coin in
//        return coin.name.lowercased().contains(lowerCasedText) || coin.symbol.lowercased().contains(lowerCasedText) || coin.id.lowercased().contains(lowerCasedText)
//    }
//
//}
