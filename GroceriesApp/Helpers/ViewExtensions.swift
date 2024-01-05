//
//  ViewExtensions.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/4/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacement(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacement(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    var safeArea: UIEdgeInsets {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        
        return .zero
    }
    
    @ViewBuilder
    func customFont(_ size: CGFloat) -> some View {
        self
            .font(.custom("Inter-Regular", size: size))
    }
}
