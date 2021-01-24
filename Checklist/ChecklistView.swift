// Lucas Haney
// ID: 2407823

import SwiftUI

// Properties
// ==========

struct ChecklistView: View {
    
    // Properties
    // ==========
    
    @ObservedObject var checklist = Checklist()
    
    @State var newChecklistItemViewIsVisible = false
    
    //User interface content and layout
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklist.items.firstIndex(where: {
                      $0.id == checklistItem.id }) {
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                        self.checklist.printChecklistContents()
                    }
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
                },
                trailing: EditButton()
            )
            
            .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear() {
                self.checklist.printChecklistContents()
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
