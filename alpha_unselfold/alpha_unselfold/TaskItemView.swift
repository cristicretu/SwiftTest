//
//  TaskItemView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI

struct TaskItemView: View {
    var name: String = ""
    var date: String = ""
    
    var body: some View {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.gray.opacity(0.6), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 5.0))
                    .frame(width: 150, height: 150)
                
                Text(name)
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
        //
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(name: "Go outside", date: "26/07/2021 19:27")
    }
}
