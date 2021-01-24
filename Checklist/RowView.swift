//
//  RowView.swift
//  Checklist
//
//  Created by Lucas Haney on 1/23/21.
//

import SwiftUI

struct RowView: View {
    
    @State var checklistItem: ChecklistItem
    
    var body: some View {
        HStack {
            Text(checklistItem.name)
            Spacer()
            Text(checklistItem.isChecked ? "✅" : "🔲")
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: ChecklistItem(name: "sample item"))
    }
}
