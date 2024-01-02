//
//  RegisterView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/2/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
 
    var body: some View {
        VStack(alignment: .leading) {
            Text("Olá! Registre-se para poder iniciar")
                .fontWeight(.bold)
                .font(.custom("Inter-Regular", size: 30))
                .lineLimit(nil)
                .frame(width: 290, alignment: .leading)
                .padding(.top, 60)
                .padding(.bottom, 30)
            
            // MARK: Form inputs
            VStack(spacing: 15) {
                InputView(textInput: $username,
                          label: "Usuário",
                          placeHolder: "Nome do usuário"
                )
                
                InputView(textInput: $email,
                          label: "Email",
                          placeHolder: "Email"
                )
                
                InputView(textInput: $password,
                          isSecurityField: true,
                          showPasswordIcon: true,
                          label: "Senha",
                          placeHolder: "senha"
                )
                
                InputView(textInput: $confirmPassword,
                          isSecurityField: true,
                          showPasswordIcon: true,
                          label: "Confirmação da senha",
                          placeHolder: "Nome do usuário"
                )
            }
            
            // MARK: Button for user register
            Button {
                // MARK: Add function for user register
            } label: {
                Text("Registrar")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.button)
                    .cornerRadius(8)
            }
            .padding(.top, 30)
            .opacity(isFormValid ? 1 : 0.7)
            .disabled(!isFormValid)
            
            Spacer()
            
            // MARK: Alternative for login
            HStack() {
                Text("Já possui conta?")
                
                NavigationLink {
                    AuthView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Entrar.")
                        .foregroundColor(.button)
                        .fontWeight(.semibold)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.custom("Inter-Regular", size: 16))
        }
        .padding(.horizontal)
    }
}

extension RegisterView: AuthFormProtocol {
    var isFormValid: Bool {
        return
            !username.isEmpty
            && email.contains("@")
            && password.count > 5
            && confirmPassword == password
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
