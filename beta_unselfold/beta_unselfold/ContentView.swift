//
//  ContentView.swift
//  beta_unselfold
//
//  Created by Cristi Cretu on 20.06.2021.
//

import SwiftUI
import CoreData

//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

struct ContentView: View {
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.gray.opacity(0.6), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 5.0))
                    .frame(width: 150, height: 150)
                
                Text("Go for a run")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.all, 10.0)
                    .frame(width: 85.0, height: 85.0)
                
                Text("🏃🏻‍♂️")
                    .font(.system(size: 60))
                    .padding(.leading, 85.0)
                
                Text("5 POINTS")
                    .font(.system(size: 10))
                    .padding(.bottom, 120.0)
                    .padding(.leading, 90.0)
                    .opacity(0.3)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color.gray.opacity(0.6), lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 5.0))
                        .frame(width: 20, height: 20)
                        .offset(x:65, y:55)
                }
                    
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.gray.opacity(0.6), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 5.0))
                    .frame(width: 150, height: 150)
                
                Text("Go for a run")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.all, 10.0)
                    .frame(width: 85.0, height: 85.0)
                
                Text("🏃🏻‍♂️")
                    .font(.system(size: 60))
                    .padding(.leading, 85.0)
                
                Text("5 POINTS")
                    .font(.system(size: 10))
                    .padding(.bottom, 120.0)
                    .padding(.leading, 90.0)
                    .opacity(0.3)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color.gray.opacity(0.6), lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 5.0))
                        .frame(width: 20, height: 20)
                        .offset(x:65, y:55)
                }
                    
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

