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
            // MARK: Text presentation
            Text("Seja bem vindo, prazer em revê-lo!")
                .fontWeight(.bold)
                .font(.custom("Inter-Regular", size: 30))
                .frame(width: 290, alignment: .leading)
                .padding(.vertical, 30)
                .padding(.top, 40)
            
            // MARK: Input's for login
            InputView(textInput: $emailInput,
                      label: "Email",
                      placeHolder: "Digite seu Email"
            )
            
            InputView(textInput: $passwordInput,
                      isSecurityField: true,
                      showPasswordIcon: true,
                      label: "Senha",
                      placeHolder: "Digite sua senha"
            )
            
            // MARK: Forgot password
            NavigationLink {
                Text("Esqueceu a senha?")
            } label: {
                Text("Esqueceu a senha?")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.text)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
                      
            // MARK: Button for user Login
            NavigationLink {
                GroceriesTabBarView()
            } label: {
                Text("Entrar")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.button)
                    .cornerRadius(8)
            }
            .padding(.top)
            .opacity(isFormValid ? 1 : 0.7)
            .disabled(!isFormValid)
                        
//            Button {
//                // MARK: Add function for user login
//            } label: {
//                Text("Entrar")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.white)
//                    .frame(maxWidth: .infinity, maxHeight: 55)
//                    .background(Color.button)
//                    .cornerRadius(8)
//
//            }
//            .padding(.top)
//            .opacity(isFormValid ? 1 : 0.7)
//            .disabled(!isFormValid)
            
            Spacer()
                   
            // MARK: Alternative for register an user
            HStack() {
                Text("Não tem uma conta?")
                
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Registre-se")
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

extension AuthView: AuthFormProtocol {
    var isFormValid: Bool {
        return emailInput.contains("@") && passwordInput.count > 5
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AuthView()
            }
            
            NavigationView {
                AuthView()
            }
            .preferredColorScheme(.dark)
        }
    }
}
