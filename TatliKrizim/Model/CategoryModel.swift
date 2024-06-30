//
//  CategoryModel.swift
//  TatliKrizim
//
//  Created by Alper Erkoca on 30.03.2024.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String    
}
var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "Hepsi"),
    CategoryModel(icon: "choco", title: "Çikolata"),
    CategoryModel(icon: "chips24", title: "Cips"),
    CategoryModel(icon: "toffee24", title: "Tatlı"),
    CategoryModel(icon: "icecream", title: "Dondurma"),
]
