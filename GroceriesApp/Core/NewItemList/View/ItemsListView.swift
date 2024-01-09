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
                        .onTapGesture {
                            self.showingBottomSheet.toggle()
                        }
                }
            }
        }
        .sheet(isPresented: $showingBottomSheet) {
            AddNewListView(closeModal: $showingBottomSheet)
                .presentationDetents([.medium])
        }
    }
    
    func didDissmis() {
        print("Close modal")
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView()
    }
}
