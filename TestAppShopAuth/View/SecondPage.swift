//
//  SecondPage.swift
//  TestAppShopAuth
//
//  Created by AlkoFitoNiashka on 18.03.2023.
//

import SwiftUI

struct SecondPage: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = SecondPageViewModel()
    
    
    @State var startingOffsetX: CGFloat = 0
    @State var currentDragOffsetX: CGFloat = 0
    
    var body: some View {
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                ZStack{
                    AsyncImage(url: URL(string: vm.mainImage)){ image in
                        image.resizable().aspectRatio(contentMode: .fill).clipped()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: screen.width * 0.85, height: screen.width * 0.85)
                    .cornerRadius(15)
                        .offset(x: startingOffsetX)
                        .offset(x: currentDragOffsetX)

                        .gesture(
                                DragGesture()
                                    .onChanged{ value in
                                        withAnimation(.spring()){
                                            currentDragOffsetX = value.translation.width
                                        }
                                    }
                                    .onEnded{ value in
                                        withAnimation(.spring()){
                                            if currentDragOffsetX < -5{
                                                vm.count += 1
                                                if vm.count >= vm.images.count{
                                                    vm.count = 0
                                                }
                                                vm.mainImage = vm.images[vm.count]
                                            } else if currentDragOffsetX > 5 {
                                                vm.count -= 1
                                                if vm.count < 0{
                                                    vm.count = vm.images.count - 1
                                                }
                                                vm.mainImage = vm.images[vm.count]
                                            }
                                            currentDragOffsetX = 0
                                        }
                                    }
                                )

                    VStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.tabSelectedItem)
                        }
                        RoundedRectangle(cornerRadius: 1)
                            .frame(width: 15, height: 1, alignment: .center)
                            .foregroundColor(.gray)
                            .padding(.vertical, 7)
                        Button {
                            
                        } label: {
                            Image(systemName: "point.3.connected.trianglepath.dotted")
                                .foregroundColor(.tabSelectedItem)
                        }


                    }
                    .padding(7)
                    .padding(.vertical, 5)
                    .background(Color.cathegory)
                    .cornerRadius(10)
                    .offset(x: 160, y: 110)
                }

                
                HStack{
                    ForEach(0..<vm.images.count, id: \.self){index in
                        Button {
                            vm.mainImage = vm.images[index]
                        } label: {
                            AsyncImage(url: URL(string: vm.images[index])){ image in
                                image.resizable().aspectRatio(contentMode: .fill).clipped()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: vm.images[index] == vm.mainImage ? (screen.width * 0.25) : (screen.width * 0.2), height: vm.images[index] == vm.mainImage ?  (screen.height * 0.09) : (screen.height * 0.07))
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
                            .padding(7)
                        }
                        .onTapGesture {
                            DragGesture(minimumDistance: 100)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(vm.product?.name ?? "")
                            .font(.system(size: 20, weight: .bold))
                            
                        
                        Spacer()
                        
                        Text("$ \(vm.product?.price ?? 0).00")
                            .fontWeight(.semibold)
                    }
                    Text(vm.product?.description ?? "...")
                        .lineLimit(2)
                        .foregroundColor(.gray.opacity(0.9))
                        .frame(alignment: .leading)
                    HStack{
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Text("\(vm.product?.rating ?? 0.0, specifier: "%.1f")")
                            .font(.system(size: 15, weight: .bold))
                        Text("(\(vm.product?.numberOfReviews ?? 0) reviews)")
                            .foregroundColor(.gray)
                        Spacer()
                        
                        
                    }
                    
                    
                    Text("Colors:")
                    HStack{
                        ForEach(vm.product?.colors ?? [""], id: \.self){ color in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(color))
                                .shadow(color: .black, radius: 1, x: 0, y: 0)
                        }
                    }

                }
                .padding(.horizontal, 5)
                HStack{
                    VStack(alignment: .leading){
                        Text("Quantity:")
                            .foregroundColor(.gray)
                            .font(.system(size: 8))
                        HStack{
                            Button {
                                vm.count -= 1
                                if vm.count <= 0{
                                    vm.count = 0
                                }
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 40, height: 25)
                                        .foregroundColor(Color.menuBlue)
                                    Text("-")
                                        .foregroundColor(.white)
                                }
                            }
                            Text("\(vm.count)")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                            Button {
                                vm.count += 1
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 40, height: 25)
                                        .foregroundColor(Color.menuBlue)
                                    Text("+")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        Text("$ \(vm.count * (vm.product?.price ?? 0))")
                            .foregroundColor(.gray)
                            .frame(width: screen.width * 0.2)
                            .font(.system(size: 13))
//                            .padding(.horizontal)
                        Button {
                            
                        } label: {
                            Text("Add to cart")
                                .lineLimit(1)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .padding()

                    }
                    .padding(5)
                    .background(Color.menuBlue)
                    .cornerRadius(20)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(20)

            
        }
            .padding(.horizontal)
            .ignoresSafeArea()
            .preferredColorScheme(.light)
    }
}
    



//@State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
//@State var currentDragOffsetY: CGFloat = 0
//@State var endingOffsetY: CGFloat = 0



//    .offset(y: startingOffsetY)
//    .offset(y: currentDragOffsetY)
//    .offset(y: endingOffsetY)
//    .gesture(
//        DragGesture()
//            .onChanged{ value in
//                withAnimation(.spring()){
//                    currentDragOffsetY = value.translation.height
//                }
//            }
//            .onEnded{ value in
//
//
//
//                withAnimation(.spring()){
//
//                    if currentDragOffsetY < -150{
//                        endingOffsetY = -startingOffsetY
//                    } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
//                        endingOffsetY = 0
//                    }
//                    currentDragOffsetY = 0
//                }
//            }
//
//    )
