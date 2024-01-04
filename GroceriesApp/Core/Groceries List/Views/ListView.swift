//
//  ListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/3/24.
//

import SwiftUI

struct ListView: View {
    @State private var selectedIndex: Filters = Filters.allItems;
    
    var body: some View {
        NavigationStack {
            Picker("Filtros", selection: $selectedIndex) {
                ForEach(Filters.allCases, id:\.self) { item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...3, id: \.self) { groceriesLists in
                        ListCardView(listTitle: "Feira de reposição", supermarketTitle: "Líder max")
                    }
                }
            }
            .refreshable {
                print("Refresh groceries list screen")
            }
            .navigationTitle("Lista de compras")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
