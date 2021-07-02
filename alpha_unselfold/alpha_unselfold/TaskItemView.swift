//
//  TaskItemView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI
import CoreData
import SwiftUIX

struct TaskItemView: View {
    var name: String = ""
    var date: String = ""
    
    var body: some View {
        VisualEffectBlurView(blurStyle: .systemThinMaterial, vibrancyStyle: .fill, content: {
            Text("\(name)")
            Text("5 pts.")
//            Text("\(date)")
//          Text("\()")
        })
        .frame(width: 150, height: 150).contentShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.75).fill(Color.white))
//
        
        //Rectangle 22
//        ZStack {
//            RoundedRectangle(cornerRadius: 30)
//            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
//
//            RoundedRectangle(cornerRadius: 30)
//            .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1)
//        }
//        .frame(width: 150, height: 150)
    }
}

//struct TaskItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskItemView(name: "Go outside", date: "26/07/2021 19:27")
//    }
//}
