//
//  Home.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 30.03.2024.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @State var selectedCategory = "Hepsi"
    @EnvironmentObject var cartManager: CartManager
    @AppStorage("uid") var userID: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("**Tatlı Krizi**")
                            .font(.system(size: 32))
                            .padding(.trailing)

                        Spacer()
                        
                        // Logout Button
                        Button(action: {
                            do {
                                try Auth.auth().signOut()
                                userID = ""
                            } catch {
                                print("Error signing out: \(error)")
                            }
                        }) {
                            Image(systemName: "door.left.hand.open")
                                .foregroundColor(.black)
                                .frame(width: 50, height: 80)
                                .background(Color.gray)
                                .clipShape(Capsule())
                        }
                        .padding(.leading, 50)
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView(selectedCategory: selectedCategory)
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 70, height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    HStack {
                        Text("**\(selectedCategory)**")
                            .font(.system(size: 24))
                            .padding(.vertical, 10)
                        Spacer()
                        NavigationLink {
                            CollectionView(selectedCategory: selectedCategory)
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 5)
                    
                    TabView {
                        ForEach(filteredProductList, id: \.id) { item in
                            ProductCard(product: item)
                                .transition(.slide)
                                .animation(.easeInOut(duration: 0.5), value: selectedCategory)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 500) // Adjust the height as needed
                }
            }
        }
    }

    var filteredProductList: [Product] {
        productList.filter { product in
            selectedCategory == "Hepsi" || product.category == selectedCategory
        }
    }

    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            withAnimation(.easeInOut) {
                                selectedCategory = item.title
                            }
                        } label: {
                            HStack {
                                if item.title != "Hepsi" {
                                    Image(item.icon)
                                        .renderingMode(.template)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                }
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.2))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}

//Product Card View

struct ProductCard: View {
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -150)
                .rotationEffect(Angle(degrees: 30))
            ZStack{
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.system(size: 28, weight: .semibold))
                    .frame(width: 140)
                Text("\(product.category)")
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(.capsule)
                
                Spacer()
                
                HStack{
                    Text("₺\(product.price).0")
                        .font(.system(size: 24,weight: .semibold))
                    
                    Spacer()
                    
                    Button{
                        cartManager.addToCart(product: product)
                    }label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width:90 ,height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -10)
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.8))
                .clipShape(.capsule)
            })
        }
            .padding(30)
            .frame(width: 336,height: 422)
    }
        .frame(width: 336,height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 0)
    }
}
