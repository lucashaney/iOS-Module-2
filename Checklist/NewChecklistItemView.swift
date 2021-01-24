// View for adding new item to the list
// Includes textfields and display elements on the sheet page designed to add a new item to the list based on user input

import SwiftUI

struct NewChecklistItemView: View {
    
    // Properties
    // ==========
    
    var checklist: Checklist
    
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    // User interface content and layout
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                    self.checklist.saveListItems()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
                
                .disabled(newItemName.count == 0)
            }
            
            Text("Swipe down to cancel.")
        }
    }
}

// Preview
// =======

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
