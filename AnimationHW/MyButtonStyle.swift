//
//  MyButtonStyle.swift
//  AnimationHW
//
//  Created by Luis on 10/4/24.
//

import Foundation
import SwiftUI

struct AnimationLB: ButtonStyle {
    @State private var recordBegin = false
    @State private var recording = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(recording ? 0.7 : 1)
            .padding(10)
            .foregroundColor(.white)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                        .frame(width: recordBegin ? 60 : 250, height: 60)
                        .foregroundColor(recordBegin ? .red : .green)
                    RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                        .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                        .stroke(lineWidth: 5)
                        .frame(width: recordBegin ? 70 : 260, height: 70)
                        .foregroundColor(.green)
                }
                    .onTapGesture {
                       withAnimation(Animation.spring()) {
                            self.recordBegin.toggle()
                            
                        }
                        withAnimation(Animation.spring().repeatForever(autoreverses: true).delay(0.9)) {
                            self.recording.toggle()
                        }
                    }
            )
    }
}
