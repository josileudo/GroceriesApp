//
//  ListCardView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/3/24.
//

import SwiftUI

struct ListCardView: View {
    @State var listTitle: String
    @State var supermarketTitle: String
    @State var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(listTitle)
                .font(.custom("Inter-Regular", size: 18))
                .foregroundColor(Color.black.opacity(0.8))
                .bold()
                .frame(maxWidth: 190, alignment: .leading)
               
            HStack(spacing: 4) {
                Image(systemName: "tag")
                Text(supermarketTitle)
            }
            .font(.subheadline)
            .foregroundColor(Color.black.opacity(0.8))
            .opacity(0.6)
            
            HStack(spacing: 4) {
              Image(systemName: "list.bullet")
              Text("Lista 1/7 Concluídos")
            }
            .font(.subheadline)
            .foregroundColor(Color.black.opacity(0.8))
            .opacity(0.6)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
        )
        .background(.linearGradient(colors: [Color.secondary.opacity(0.015), Color.secondary.opacity(0.01)], startPoint: .leading, endPoint: .trailing))
        .shadow(color: Color.secondary.opacity(0.3), radius: 8, x:0, y:12)
        .shadow(color: Color.secondary.opacity(0.3), radius: 2, x:0, y:1)
        .overlay(
            // MARK: Favorite card
            VStack {
                ZStack() {
                    Button {
                        self.isFavorite.toggle()
                    } label: {
                        ZStack {
                            Image(systemName: self.isFavorite ? "heart.fill" : "heart")
                                .tint(.button)
                            Circle()
                                .tint(.button.opacity(0.1))
                                .frame(maxHeight: 35)
                        }
                    }
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(8)
        )
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(listTitle: "Feira mensal", supermarketTitle: "Hiper morada nova")
    }
}
