//
//  ListModel.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/4/24.
//

import Foundation

enum Filters: String, Identifiable, CaseIterable {
    case allItems = "Todas"
    case completed = "Cocluídas"
    case notCompleted = "Não concluídas"    
    var id: Filters { self }
}
