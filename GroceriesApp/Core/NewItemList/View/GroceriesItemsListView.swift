//
//  GroceriesItemsListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/8/24.
//

import SwiftUI

struct GroceriesItemsListView: View {
    @State private var isSaveItem: Bool = false
    @State var quantityItem: Int = 0
    
    @State private var items: [GroceriesItemModel] = [
        GroceriesItemModel(title: "Feijão", quantity: 0),
        GroceriesItemModel(title: "Arroz", quantity: 0)
    ]
    
    var body: some View {
        VStack {
            Text("Adicione itens a sua cesta")
                .customFont(18)
                .bold()
                .padding(.bottom)
            
            ScrollView {
                ForEach($items) { $item in
                    AddItemsView(groceriesItemModel: $item)
                        .padding(.vertical, 4)
                    
                    Divider()
                }
            }
            
            Spacer()
            
            Button(action: {
                self.isSaveItem.toggle()
            }, label: {
                Text("Salvar lista")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.button)
                    .cornerRadius(8)
            })
            .navigationDestination(isPresented: $isSaveItem) {
                ListView()
                    .navigationBarBackButtonHidden()
            }
            .padding(.vertical)
        }
        .vSpacement(.top)
    }
}

struct GroceriesItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesItemsListView()
    }
}
