//
//  GroceriesApp.swift
//  GroceriesApp
//
//  Created by Josileudo on 12/27/23.
//

import SwiftUI
import FirebaseCore

@main
struct GroceriesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
          NavigationView {
            ContentView()
          }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    return true
  }
}
