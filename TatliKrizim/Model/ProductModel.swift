//
//  ProductModel.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 6.04.2024.
//

import SwiftUI

struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

//Sample Products
var productList = [
    Product(name: "Ben & Jerry's", category: "Dondurma", image: "benjerry", color: .yellow ,price: 70),
    Product(name: "Pudding", category: "Tatlı", image: "pudding", color: .brown ,price: 18),
    Product(name: "Good Source", category: "Çikolata", image: "goodsource",color: .indigo, price: 25),
    Product(name: "M&M's", category: "Çikolata", image: "mms", color: .blue ,price: 25),
    Product(name: "Oreo Ice Cream", category: "Dondurma", image: "oreodondurma", color: .purple ,price: 65),
    Product(name: "Honey Buns", category: "Tatlı", image: "honeybuns", color: .indigo ,price: 55),
    Product(name: "Lindt", category: "Çikolata", image: "lindt", color: .green ,price: 70),
    Product(name: "Jalepeno Chips", category: "Cips", image: "jalepenochips", color: .orange ,price: 40),
    Product(name: "Reeses", category: "Çikolata", image: "reeses", color: .yellow ,price: 30),
    Product(name: "Hersheys", category: "Çikolata", image: "hersheys", color: .purple ,price: 60),
    Product(name: "Dark Russet", category: "Cips", image: "darkrusset", color:.brown , price: 35),
    Product(name: "M&M's Ice Cream", category: "Dondurma", image: "mmsice", color: .yellow ,price: 65),
    Product(name: "Crab Chips", category: "Cips", image: "crabb", color: .purple ,price: 45),
    Product(name: "Honey Chips", category: "Cips", image: "honeychips", color: .blue ,price: 35),
    Product(name: "Cheetos", category: "Cips", image: "cheetos", color: .green ,price: 15),
    Product(name: "Kettle Potato Cips", category: "Cips", image: "kettlepotato", color: .indigo ,price: 35),
    Product(name: "Oreo Mint", category: "Tatlı", image: "oreomint", color: .red ,price: 50),
    Product(name: "Doritos Cool Ranch", category: "Cips", image: "coolranch", color: .mint ,price: 35),
    Product(name: "Chips Ahoy", category: "Tatlı", image: "chipsahoy", color: .yellow ,price: 75),
    Product(name: "Cadbury Caramel", category: "Çikolata", image: "cadbury", color: .purple ,price: 42),
    Product(name: "Pudding", category: "Tatlı", image: "pudding", color: .blue ,price: 20),
    Product(name: "Soft Baked", category: "Tatlı", image: "softbaked", color: .gray ,price: 50),
    Product(name: "Popcorn Caramel", category: "Tatlı", image: "popcorncaramel", color: .red ,price: 38),
    Product(name: "Bettergoods Ice Cream", category: "Dondurma", image: "bettergoods", color: .indigo ,price: 65),
]

