//
//  ItemModel.swift
//  ToDoList
//
//  Created by Harsh Raj on 12/06/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    
    var itemTitle: String
    var isCompleted: Bool
}
