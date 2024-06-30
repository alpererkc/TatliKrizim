//
//  ContentView.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 30.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Home()
                    .environmentObject(cartManager)
                
                if cartManager.products.count > 0 {
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        HStack(spacing: 10) {
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(Color.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading) {
                                Text("Sepet")
                                    .font(.system(size: 26, weight: .semibold))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                                Text("\(cartManager.products.count) Ürün")
                                    .font(.system(size: 18))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                            }
                            .frame(maxWidth: 100)
                            
                            Spacer()
                            
                            HStack(spacing: -20) {
                                ForEach(cartManager.products.prefix(2), id: \.name) { product in
                                    Image(product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(8)
                                        .frame(width: 60, height: 60)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                                
                                if cartManager.products.count > 2 {
                                    Text("+\(cartManager.products.count - 2)")
                                        .padding()
                                        .background(Color.gray)
                                        .clipShape(Circle())
                                        .foregroundColor(.white)
                                        .frame(width: 60, height: 60)
                                }
                            }
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .foregroundColor(.white)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
