//
//  ContentView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI
import CoreData
import SwiftUIX

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TaskItem.getAllTaskItems()) var TaskItems:FetchedResults<TaskItem>
    
    @State private var newTaskItem = ""
    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            
            VStack (alignment: .leading) {
                
                Text("Home")
                    .font(.title)
                    .fontWeight(.black)
                    .padding(.top)
                
                Text("What's next for you: ")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top)
                
                cards
            }
            .padding(.leading)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
        }
        
    }
    
    var cards: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(self.TaskItems) { taskitem in
                        TaskItemView(name: taskitem.name!, date: "\(taskitem.date!)")
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
    
    var background: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8470588235, green: 0.337254902, blue: 0.3137254902, alpha: 1)), Color(#colorLiteral(red: 0.8470588235, green: 0.4823529412, blue: 0.9450980392, alpha: 1)), Color(#colorLiteral(red: 0.7411764706, green: 0.9294117647, blue: 0.9254901961, alpha: 1)), Color(#colorLiteral(red: 0.9137254902, green: 0.8784313725, blue: 0.5647058824, alpha: 1)), Color(#colorLiteral(red: 0.8470588235, green: 0.337254902, blue: 0.3137254902, alpha: 1))]), center: .center, angle: .degrees(120))
            
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(1)]), startPoint: .bottom, endPoint: .top)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
