//
//  LoginView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/28/23.
//

import SwiftUI
import Lottie

struct LoginView: View {
    var body: some View {
        VStack() {
            LottieView(url: "list")
                .frame(width: 400, height: 400)
            
            VStack(spacing: 15) {
                NavigationLink {
                    // MARK: Function for login
                    Text("Login")
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
        LoginView()
    }
}
