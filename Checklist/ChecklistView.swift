// Lucas Haney
// ID: 2407823


// Main View
// Includes navigation bar items/title, for each loop, move and delete calls and sheet presentation

import SwiftUI

struct ChecklistView: View {
    
    // Properties
    // ==========
    
    @ObservedObject var checklist = Checklist()
    
    @State var newChecklistItemViewIsVisible = false
    
    //User interface content and layout
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { index in
                    RowView(checklistItem: self.$checklist.items[index])
                }
                
                .onMove(perform: checklist.moveListItem)
                .onDelete(perform: checklist.deleteListItem)
            }
            
            .listStyle(PlainListStyle())
            .navigationBarItems(
                leading: Button(action: { self.newChecklistItemViewIsVisible = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }
                })
            
            .toolbar{
                EditButton()
            }
            .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear() {
                self.checklist.printChecklistContents()
                self.checklist.saveListItems()
            }
        }
        
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist)
        }
    }
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
