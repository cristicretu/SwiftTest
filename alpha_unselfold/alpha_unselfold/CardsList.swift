//
//  CardsList.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 02.07.2021.
//

import SwiftUI

struct CardsList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TaskItem.getAllTaskItems()) var TaskItems:FetchedResults<TaskItem>
    
    @State private var newTaskItem = ""
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(self.TaskItems) { taskitem in
                    TaskItemView(name: taskitem.name!, date: "\(taskitem.date!)")
                        .contextMenu {
                            Button {
                                print("This is going to mark it as completed and then display the checkmark and move it at the end of the hstack")
                            } label: {
                                Label("Mark as completed", systemImage: "checkmark")
                            }

                            Button {
                                self.managedObjectContext.delete(taskitem)
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print("Could not delete from database")
                                }
                            } label: {
                                Label("Remove task", systemImage: "trash")
                            }
                        }
                }
                .onDelete {indexset in
                    let deleteItem = self.TaskItems[indexset.first!]
                    self.managedObjectContext.delete(deleteItem)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print("Could not delete from database")
                    }
                    
                }

                
            }
        }
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList()
    }
}
