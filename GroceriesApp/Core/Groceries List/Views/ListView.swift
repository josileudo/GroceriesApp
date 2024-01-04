//
//  ListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/3/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...3, id: \.self) { groceriesLists in
                        ListCardView(listTitle: "Feira de reposição", supermarketTitle: "Líder max")
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
