//
//  GroceriesItems.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/8/24.
//

import Foundation

struct GroceriesItemModel: Identifiable, Codable {
    var id: String
    var title: String
    var quantity: Int
    
    init(id: String = UUID().uuidString, title: String, quantity: Int) {
        self.id = id
        self.title = title
        self.quantity = quantity
    }
    
    mutating func addItem() {
        quantity += 1
    }
    
    mutating func minusItem() {
        if(quantity > 0) {
            quantity -= 1
        }
    }
}
