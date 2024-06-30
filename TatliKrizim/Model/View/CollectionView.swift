//
//  CollectionView.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 6.04.2024.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode
    var selectedCategory: String
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("**Tatlı Krizi**'ni keşfet")
                            .font(.system(size: 36))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(filteredProductList, id: \.id){ item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }

    var filteredProductList: [Product] {
        productList.filter { product in
            selectedCategory == "Hepsi" || product.category == selectedCategory
        }
    }
}

#Preview {
    CollectionView(selectedCategory: "Hepsi")
        .environmentObject(CartManager())
}

struct SmallProductCard: View {

    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View{
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -100)
                .rotationEffect(Angle(degrees: 30))
            VStack(alignment: .leading ,  content: {
                Text("\(product.name)")
                    .font(.system(size: 15).weight(.semibold))
                    .frame(width: 70)
                
                Text(product.category)
                    .font(.system(size: 10))
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack{
                    Text("₺\(product.price).0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Spacer()
                    
                    Button{
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 45, height: 40)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing, -12)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(Color.white.opacity(0.5))
                .clipShape(Capsule())
            })
        }
        .padding(20)
        .frame(width: 170, height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading, 10)
    }
}
