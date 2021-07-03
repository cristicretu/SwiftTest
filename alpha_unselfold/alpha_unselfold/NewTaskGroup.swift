//
//  NewTaskGroup.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI

struct NewTaskGroup: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TaskItem.getAllTaskItems()) var TaskItems:FetchedResults<TaskItem>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewTaskGroup_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskGroup()
    }
}
