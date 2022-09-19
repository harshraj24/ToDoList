//
//  ListRowView.swift
//  ToDoList
//
//  Created by Harsh Raj on 09/06/22.
//

import SwiftUI

struct ListRowView: View {
    let list: ItemModel
    var body: some View {
        HStack {
            Image(systemName: list.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(list.isCompleted ? .green : .red)
            Text(list.itemTitle)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(itemTitle: "1st Element", isCompleted: true)
    static var item2 = ItemModel(itemTitle: "2nd Element", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(list: item1)
            ListRowView(list: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
