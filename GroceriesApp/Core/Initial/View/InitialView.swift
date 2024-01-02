//
//  LoginView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/28/23.
//

import SwiftUI
import Lottie

struct InitialView: View {
    var body: some View {
        VStack() {
            // MARK: Lottie image
            LottieView(url: "list")
                .frame(width: 400, height: 400)
            
            // MARK: Logo mark
            HStack(spacing: .zero) {
                Text("Groceries")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(Color.button)
                Text("List")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
            }
            
            // MARK: Buttons navigation
            VStack(spacing: 15) {
                NavigationLink {
                    // MARK: Function for login
                    AuthView()
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 330, height: 51)
                        .background(Color.button)
                        .cornerRadius(8)
                }
                
                NavigationLink {
                    // MARK: Function for register
                    Text("Registrar")
                    
                } label: {
                    Text("Registrar")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.button)
                        .frame(width: 330, height: 51)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 8,
                                style: .continuous
                            )
                            .stroke(Color.button, lineWidth: 1)
                        )
                }
            }
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InitialView()
        }
    }
}
