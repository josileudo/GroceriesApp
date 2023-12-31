//
//  LottieView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/30/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
     var url: String
     let animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named(url)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
                
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
