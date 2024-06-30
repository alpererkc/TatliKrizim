//
//  CartView.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 6.04.2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Sepet")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                            
                        Button {
                            cartManager.clearCart()
                            navigateToHome = true
                        } label: {
                            Image(systemName: "trash")
                                .frame(width: 60, height: 80)
                                .background(Color.red.opacity(0.5))
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                        }
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(cartManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 60, height: 80)
                                .background(Color.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    // Cart Products
                    VStack(spacing: 20) {
                        ForEach(cartManager.products, id: \.name) { item in
                            CardProductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Cart Total
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Gönderim Bedeli")
                            Spacer()
                            Text(shippingFeeText)
                                .font(.system(size: 24, weight: .semibold))
                        }
                        Divider()
                        
                        HStack {
                            Text("Toplam Tutar")
                                .font(.system(size: 24))
                            Spacer()
                            Text("\(totalWithShipping)₺")
                                .font(.system(size: 36, weight: .semibold))
                        }
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding()
                    
                    // Payment Button
                    Button {
                        
                    } label: {
                        Text("Ödeme Yap")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(Color.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    // Clear Cart Button
                   
                    
                    // Navigation link to home
                    NavigationLink(destination: Home().environmentObject(cartManager), isActive: $navigateToHome) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    var shippingFee: Int {
        return cartManager.total < 150 ? 20 : 0
    }
    
    var shippingFeeText: String {
        return cartManager.total < 150 ? "₺20" : "Ücretsiz"
    }
    
    var totalWithShipping: Int {
        return cartManager.total + shippingFee
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

struct CardProductCard: View {
    
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .center, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            Spacer()
            
            Text("₺\(product.price)")
                .padding()
                .background(Color.yellow.opacity(0.5))
                .clipShape(Circle())
        }
    }
}
