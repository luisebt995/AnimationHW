//
//  ContentView.swift
//  AnimationHW
//
//  Created by Luis on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var goToDibujarVista = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: MoreAnimations(), isActive: $goToDibujarVista)
                {
                    EmptyView()
                }
                Button(){
                    
                } label: {
                    HStack{
                        Text("Hola")
                        Image(systemName: "mic.fill")
                    }
                }
                .buttonStyle(AnimationLB(changeView: $goToDibujarVista))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
