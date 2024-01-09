//
//  ListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/3/24.
//

import SwiftUI

struct ListView: View {
    @State private var selectedIndex: Filters = Filters.allItems
    @State private var showingBottomSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                FiltersView()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(0...3, id: \.self) { groceriesLists in
                            NavigationLink {
                                ItemsListView()
                                    .navigationBarTitle("Feira de reposição")
                            } label: {
                                ListCardView(listTitle: "Feira de reposição", supermarketTitle: "Líder max")
                            }
                        }
                    }
                }
                .refreshable {
                    print("Refresh groceries list screen")
                }
            }
            .navigationBarTitle("Lista de compras", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NewListView(showingSheet: $showingBottomSheet)
                    } label: {
                        Image(systemName: "plus")
                            .customFont(16)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                            .background(Color.button, in: Circle())
                            .containerShape(Circle())
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: Filters
    @ViewBuilder
    func FiltersView() -> some View {
        Picker("Filtros", selection: $selectedIndex) {
            ForEach(Filters.allCases, id:\.self) { item in
                Text(item.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding(.vertical)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}

