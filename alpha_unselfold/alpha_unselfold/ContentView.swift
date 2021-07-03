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
            
//            HStack {
//               TextField("new Item", text: self.$newTaskItem)
//               Button(action: {
//                   let TaskItem = TaskItem(context: self.managedObjectContext)
//                   TaskItem.name = self.newTaskItem
//                   TaskItem.date = Date()
//
//                   do {
//                       try self.managedObjectContext.save()
//                   } catch {
//                       print("Could not save to database")
//                   }
//
//                   self.newTaskItem = ""
//
//               }) {
//                   Image(systemName: "plus.circle.fill")
//                       .foregroundColor(.green)
//                       .imageScale(.large)
//               }
//           }
            
            VStack (alignment: .leading) {
                
                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                HStack {
                    Text("What's next for you: ")
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.top)
                    Spacer()
                    
                    Button(action: {}, label: {
                        VisualEffectBlurView(blurStyle: .systemThinMaterial, vibrancyStyle: .fill, content: {
                            HStack {
                                Text("New")
                                Image(systemName: "plus.circle.fill")
                            }
                        })
                        .frame(width: 80, height: 30).contentShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.75).fill(Color.white))
                        .padding(.top)
                        .padding(.trailing)
                    })
                    .sheet(isPresented: $newTaskItem, content: {
                        NewTaskGroup()
                    })
                    
                    Button {
                        print("messi")
                    }
                }
                
                CardsList()
            }
            .padding(.leading)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
        }
    }
    
    var bg1: some View {
        ZStack {
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.1568627506494522, green: 0.1764705926179886, blue: 0.9019607901573181, alpha: 1)), location: 0.2547817528247833),
                    .init(color: Color(#colorLiteral(red: 0.5215686559677124, green: 0.5333333611488342, blue: 0.9411764740943909, alpha: 1)), location: 0.701310932636261)]),
                        startPoint: UnitPoint(x: 0.5583153007358956, y: -0.28169855777025077),
                        endPoint: UnitPoint(x: 0.49999996817926284, y: 0.9999999643201601))
            
            RoundedRectangle(cornerRadius: 60)
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: 0.4927837985699711, y: 0.38978744102684004),
                        endPoint: UnitPoint(x: 1.8983222422571457, y: 0.6545800555322785)))
            .frame(width: 522.9, height: 37)
            .rotationEffect(.degrees(39.19))
            .opacity(0.5)
            .offset(x: -250, y: -250)
            
            RoundedRectangle(cornerRadius: 60)
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: -0.5287444448059945, y: -3.562176999210294),
                        endPoint: UnitPoint(x: 2.5671425924418747, y: 1.0755951895698672)))
            .frame(width: 475.9, height: 21)
            .rotationEffect(.degrees(39.19))
            .opacity(0.5)
                .offset(x: -270, y: -440)
            
            RoundedRectangle(cornerRadius: 60)
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 0),
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.4927837985699711, y: 0.38978744102684004),
                        endPoint: UnitPoint(x: 1.8983222422571457, y: 0.6545800555322785)))
            .frame(width: 522.9, height: 37)
            .rotationEffect(.degrees(-42.92))
            .opacity(0.5)
                .offset(x: 50, y: 150)
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
