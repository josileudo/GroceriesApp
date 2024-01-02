//
//  InputView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/31/23.
//

import SwiftUI

struct InputView: View {
    @Binding var textInput: String;
    @State var isSecurityField: Bool = false
    @State var showPasswordIcon: Bool = false
    
    var label: String
    var placeHolder: String;
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
                .lineSpacing(20)
            
            ZStack(alignment: .trailing) {
                if isSecurityField {
                    SecureField(placeHolder, text: $textInput)
                        .padding(.horizontal)
                        .font(.system(size: 15))
                        .frame(height: 56)
                        .background(Color.backgroundInput)
                        .cornerRadius(8)
                } else {
                    TextField(placeHolder, text: $textInput)
                        .padding(.horizontal)
                        .font(.system(size: 15))
                        .frame(height: 56)
                        .background(Color.backgroundInput)
                        .cornerRadius(8)
                }
                
                if showPasswordIcon {
                    Button(action: {
                        isSecurityField.toggle()
                    }) {
                        Image(systemName: self.isSecurityField ? "eye" : "eye.slash")
                    }
                }
            }
                       
            Divider()
        }        
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(textInput: .constant("Joshua"), isSecurityField: false, showPasswordIcon: true, label: "Email", placeHolder: "Text example")
    }
}
