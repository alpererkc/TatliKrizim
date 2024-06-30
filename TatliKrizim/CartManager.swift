//
//  CartManager.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 10.04.2024.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func clearCart() {
        products.removeAll()
        total = 0
    }
}
