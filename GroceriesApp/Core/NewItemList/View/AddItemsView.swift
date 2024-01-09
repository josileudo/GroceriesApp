//
//  AddItemsView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/8/24.
//

import SwiftUI

struct AddItemsView: View {
    @Binding var groceriesItemModel: GroceriesItemModel
        
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    groceriesItemModel.addItem()
                }
            } label: {
                Image(systemName: "plus")
                    .customFont(16)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.button)
                    .frame(width: 25, height: 25)
                    .background(groceriesItemModel.quantity > 0
                                ? Color.button.opacity(0.3)
                                : Color.button.opacity(0)
                                , in: Circle()
                    )
                    .containerShape(Circle())
            }
            
            Text(groceriesItemModel.title)
            
            Spacer()
           
            HStack {
                Text("\(groceriesItemModel.quantity)")
                    .padding(.horizontal)
                
                if(groceriesItemModel.quantity > 0) {
                    
                    Button {
                        withAnimation(.easeIn(duration: 0.1)) {
                            groceriesItemModel.minusItem()
                        }
                    } label: {
                        Image(systemName: "minus")
                            .customFont(16)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.button)
                            .frame(width: 25, height: 25)
                            .background(Color.button.opacity(0.3), in: Circle())
                            .containerShape(Circle())
                    }
                }
            }
        }
    }
}

struct AddItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemsView(groceriesItemModel: .constant(GroceriesItemModel(title: "Feijão", quantity: 0)))
    }
}
