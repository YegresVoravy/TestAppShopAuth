//
//  ProfileViewModel.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 15.03.2023.
//

//import SwiftUI
//import PhotosUI
//
//class ProfileViewModel: ObservableObject{
//    @Published var loadedImage: MediaFile?
//    @Published var selectedPhoto: PhotosPickerItem?{
//        didSet{
//            if let selectedPhoto{
//                processPhoto(photo: selectedPhoto)
//            }
//        }
//    }
//
//    func processPhoto(photo: PhotosPickerItem){
//        photo.loadTransferable(type: Data.self) { result in
//            DispatchQueue.main.async {
//                switch result{
//                case .success(let data):
//                    if let data, let image = UIImage(data: data){
//                        self.loadedImage = MediaFile(image: Image(uiImage: image), data: data)
//                    }
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//        }
//    }
//}
