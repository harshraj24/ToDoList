//
//  ItemViewModel.swift
//  ToDoList
//
//  Created by Harsh Raj on 13/06/22.
//

import Foundation


class ItemViewModel: ObservableObject {
    @Published var list: [ItemModel] = [] {
        didSet {
            saveData()
        }
    }
    let listItems = "listItems"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: listItems) else { return }
        guard let listItem = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        list.append(contentsOf: listItem)
    }
    
    func deleteItem(indexSet: IndexSet) {
        list.remove(atOffsets: indexSet)
    }
    
    func moveItem(fromIndex: IndexSet, toIndex: Int) {
        list.move(fromOffsets: fromIndex, toOffset: toIndex)
    }
    
    func addItem(title: String) {
        list.append(ItemModel(itemTitle: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = list.firstIndex(where: { $0.id == item.id }) {
            list[index].isCompleted = !list[index].isCompleted
        }
    }
    
    func saveData() {
        if let encodableData = try? JSONEncoder().encode(list) {
            UserDefaults.standard.set(encodableData, forKey: listItems)
        }
    }
    
}
