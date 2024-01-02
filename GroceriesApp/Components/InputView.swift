//
//  InputView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/31/23.
//

import SwiftUI

struct InputView: View {
    @Binding var textInput: String;
    
    var text: String
    var isSecurityField: Bool = false
    var placeHolder: String;
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(text)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
                .lineSpacing(20)
            
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
            
            Divider()
        }        
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(textInput: .constant("Joshua"), text: "Email", isSecurityField: true, placeHolder: "Text example")
    }
}
