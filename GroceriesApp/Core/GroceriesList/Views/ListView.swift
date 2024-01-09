//
//  ListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/3/24.
//

import SwiftUI

struct ListView: View {
    @State private var selectedIndex: Filters = Filters.allItems;
    @State private var showingBottomSheet: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            NavigationStack {
                Section {
                    FiltersView(size)
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(0...3, id: \.self) { groceriesLists in
                                NavigationLink {
                                    ListCardView(listTitle: "Feira de reposição", supermarketTitle: "Líder max")
                                } label: {
                                    ListCardView(listTitle: "Feira de reposição", supermarketTitle: "Líder max")
                                }
                            }
                        }
                    }
                    .refreshable {
                        print("Refresh groceries list screen")
                    }
                } header: {
                    HeaderView(size)
                }
            }
            .padding(.horizontal)
        }
    }
        
    
    // MARK: Header view
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        VStack {
            Text("Bem vindo!")
                .customFont(28)
                .bold()            
        }
        .hSpacement(.leading)
        .overlay(alignment: .trailing) {
            NavigationLink {
                NewListView(showingSheet: $showingBottomSheet)
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.button, in: Circle())
                    .containerShape(Circle())
            }
        }
        .padding(.bottom, 15)
    }
    
    // MARK: Filters
    @ViewBuilder
    func FiltersView(_ size: CGSize) -> some View {
        Picker("Filtros", selection: $selectedIndex) {
            ForEach(Filters.allCases, id:\.self) { item in
                Text(item.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
