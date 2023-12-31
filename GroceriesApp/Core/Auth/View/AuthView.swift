//
//  AuthView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/31/23.
//

import SwiftUI

struct AuthView: View {
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Seja bem vindo, prazer em revê-lo!")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .frame(width: 290, alignment: .leading)
                .padding(.vertical)
                        
            InputView(textInput: $emailInput,
                      text: "Email",
                      placeHolder: "Digite seu Email"
            )
            
            InputView(textInput: $passwordInput,
                      text: "Senha",
                      isSecurityField: true,
                      placeHolder: "Digite sua senha"
            )
        }
        .padding(.horizontal)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
