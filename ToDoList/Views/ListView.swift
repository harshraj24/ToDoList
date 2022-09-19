//
//  ListView.swift
//  ToDoList
//
//  Created by Harsh Raj on 09/06/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var items: ItemViewModel
    
    var body: some View {
        ZStack {
            if items.list.isEmpty {
                Text("No Data Available")
            } else {
                List {
                    ForEach(items.list) { item in
                        ListRowView(list: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    items.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: items.deleteItem)
                    .onMove(perform: items.moveItem)
                }
                .background(.white)
                .listStyle(.plain)
            }
        }
        .navigationTitle("ToDo List 📝")
        .foregroundColor(.black)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddNotes())
        )
    }
    
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ItemViewModel())
    }
}

