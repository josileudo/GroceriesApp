//
//  NewListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/8/24.
//

import SwiftUI

struct NewListView: View {
    @State private var listName: String = ""
    
    var body: some View {
        VStack {
            LottieView(url: "fruits")
                .frame(width: 200, height: 200)
            
            TextField("Nova lista", text: $listName)
                .padding(.horizontal)
                .customFont(22)
                .frame(height: 60)
                .background(Color.backgroundInput)
                .cornerRadius(8)
            
            Spacer()
            
            NavigationLink {
            // MARK: Add function for user login
                Text("Items")
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Criar nova lista")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.button)
                    .cornerRadius(8)
            }
        }
        .hSpacement(.leading)
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewListView()
        }
    }
}
