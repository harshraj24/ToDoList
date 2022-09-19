//
//  AddNotes.swift
//  ToDoList
//
//  Created by Harsh Raj on 09/06/22.
//

import SwiftUI

struct AddNotes: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var items: ItemViewModel
    @State var textField: String = ""
    
    @State var isAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            TextField(" Click to add...", text: $textField)
                .frame(height: 80)
                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .cornerRadius(10)
                .padding(.horizontal)
            Button (action: saveButtonAction, label: {
                Text("Save".uppercased())
            })
            .frame(height:50)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
        }
        .navigationTitle("Add Notes ✏️")
        .alert(isPresented: $isAlert, content: showAlert)
    }
    
    func saveButtonAction() {
        if checkCharacters() {
            items.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func checkCharacters() -> Bool {
        if textField.count < 3 {
            alertTitle = "This must contains 3 letters 😨"
            isAlert.toggle()
            return false
        }
        return true
    }
    
    func showAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddNotes_Previews: PreviewProvider {
    static var previews: some View {
        AddNotes()
    }
}
