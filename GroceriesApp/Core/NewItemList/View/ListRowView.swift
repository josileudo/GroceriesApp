//
//  ListRowItemsView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/8/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "poweroff")
                    .foregroundColor(Color.button)
                
                Text(item.title)
                    .customFont(16)
            }
        }
        .hSpacement(.leading)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title: "Test 1", isCompleted: false))
    }
}
