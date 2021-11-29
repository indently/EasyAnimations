//
//  ContentView.swift
//  EasyAnimations
//
//  Created by Federico on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    @State private var angleDegrees = 0.0
    
    var body: some View {
        VStack {
            Button("Slow Motion") {
                withAnimation(.easeInOut(duration: 2)) {
                    isShowing.toggle()
                    self.angleDegrees += 90
                }
            }
            Spacer()
            if isShowing {
                Text("I move in a direction")
                    .transition(.move(edge: .top))
                Text("I fade in")
                Text("I scale in")
                    .transition(.scale)
                Text("I slide in")
                    .transition(.slide)
            }
            Rectangle().rotation(Angle.degrees(angleDegrees))
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            Spacer()
            Toggle("Show/Hide", isOn: $isShowing.animation(.easeInOut(duration: 0.5)))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
