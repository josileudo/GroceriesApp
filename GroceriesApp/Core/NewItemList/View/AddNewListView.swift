//
//  AddNewListView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/5/24.
//

import SwiftUI 
struct AddNewListView: View {
    @Binding var closeModal: Bool
    
    @State var title: String = "Criar novo item"
    @State var itemName: String = ""
    @State var quantity: Int = 0
    @State var unit: Int = 0
    @State var price: Double = 0
    @State var description: String = ""
    @State var selectedUnit: String = "Kg"
   
    private var units = ["Kg", "g", "Unidades"]
    
    init(closeModal: Binding<Bool>) {
        _closeModal = closeModal
    }
    
    var body: some View {
        
        VStack {
            HeaderView()
            FormView()
            
            Button {
                // MARK: Add function for user login                
           } label: {
               Text("Salvar")
                   .font(.subheadline)
                   .fontWeight(.semibold)
                   .foregroundColor(Color.white)
                   .frame(maxWidth: .infinity, maxHeight: 55)
                   .background(Color.button)
                   .cornerRadius(8)
           }
           .padding(.top)
           .disabled(!isFormValid)
           .opacity(isFormValid ? 1 : 0.7)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack {
            Text(title)
                .customFont(24)
                .bold()
        }
        .hSpacement(.leading)
        .overlay(alignment: .trailing) {
            Button {
                closeModal.toggle()
            } label: {
                ZStack {
                    Circle()
                        .tint(.button.opacity(0.1))
                        .frame(width: 45, height: 45)
                    Image(systemName: "xmark")
                        .foregroundColor(.button)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding(.bottom, 15)
    }
    
    @ViewBuilder
    func FormView() -> some View {
        Section {
            InputView(textInput: $itemName, label: "Nome do item", placeHolder: "Digite o nome do ítem")
            
            HStack(alignment:.top) {
                CustomNumber("Quantidade", $quantity)
                
                VStack(alignment: .leading) {
                    Text("Unidade")
                        .foregroundColor(Color(.darkGray))
                        .fontWeight(.semibold)
                        .customFont(13)
                        .lineSpacing(20)
                    
                    Picker("Unidades", selection: $selectedUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .background(Color.backgroundInput)
                    .cornerRadius(8)
                    .hSpacement(.leading)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Preço")
                    .foregroundColor(Color(.darkGray))
                    .fontWeight(.semibold)
                    .customFont(13)
                    .lineSpacing(20)
                
                TextField("test 1", value: $price, formatter: numberFormatted)
                    .padding(.horizontal)
                    .font(.system(size: 15))
                    .frame(height: 56)
                    .background(Color.backgroundInput)
                    .cornerRadius(8)
                    .keyboardType(.numberPad)
            }
            
            InputView(textInput: $description, label: "Descrição", placeHolder: "Faça sua descrição")
        }
    }
    
    @ViewBuilder
    func CustomNumber(_ title: String, _ value: Binding<Int>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .customFont(13)
                .lineSpacing(20)
            
            TextField("test 1", value: value, format: .number )
                .padding(.horizontal)
                .font(.system(size: 15))
                .frame(height: 56)
                .background(Color.backgroundInput)
                .cornerRadius(8)
        }
    }
    
    var numberFormatted: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}

extension AddNewListView: AuthFormProtocol {
    var isFormValid: Bool {
        return !itemName.isEmpty && quantity > 0 && price > 0
    }
}


struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewListView(closeModal: .constant(false))
        }
    }
}
