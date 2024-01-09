//
//  ContentView.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//            InitialView()
        NavigationView {
            GroceriesTabBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
