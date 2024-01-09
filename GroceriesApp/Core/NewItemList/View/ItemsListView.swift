//
//  ItemsListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/8/24.
//

import SwiftUI

struct ItemsListView: View {
    @State var showingBottomSheet: Bool = false
    
    private var items: [ItemModel] = [
        ItemModel(title: "Café", isCompleted: false),
        ItemModel(title: "Açucar", isCompleted: true),
        ItemModel(title: "Refrigerante", isCompleted: true),
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    ListRowView(item: item)
                }
            }
        }
//        .sheet(isPresented: $showingBottomSheet) {
//            NewListView()
//                .presentationDetents([.medium])
//                .padding(24)
//        }
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView()
    }
}
