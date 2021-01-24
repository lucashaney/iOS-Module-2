// View for designing each row in the list based on the initial array and user input
// Includes navigation link to the edit page and diaply features for each row

import SwiftUI

struct RowView: View {
    
    // Properties
    // ==========
    
    @Binding var checklistItem: ChecklistItem
    
    // User interface content and layout
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "🔲")
            }
        }
    }
}

// Preview
// =======
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
