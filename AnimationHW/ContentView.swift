//
//  ContentView.swift
//  AnimationHW
//
//  Created by Luis on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(){
            
        } label: {
            HStack{
                Text("Hola")
                Image(systemName: "mic.fill")
            }
        }
        .buttonStyle(AnimationLB())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
