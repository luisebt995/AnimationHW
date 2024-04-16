//
//  MoreAnimations.swift
//  AnimationHW
//
//  Created by Luis on 10/4/24.
//

import SwiftUI

struct MoreAnimations: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    @State private var isLoading = false
    
    var body: some View {
        VStack{
            ZStack {
                Text("Corazón Animado!!")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -115)
                //Llamamos a Circle() y le damos tamaño y color con .frame
                //Con ? el color variará entre los 2 valores que le indiquemos, dependiendo de la variable de estado circleColorChanged.
                //La variable de estado cambia de valor con toggle(), cuando piulsamos sobre el círculo, con el evento onTapGesture()
                Circle()
                    .frame(width: 200, height: 200) .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
                //.animation(.linear)
                Image(systemName: "heart.fill")
                    .foregroundColor(heartColorChanged ? .red : .white)
                    .font(.system(size: 100))
                    .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                // .animation(.linear)
            }
            .padding(.top,20)
            //Este tipo de animación está obsoleto, aunque funciona.
            //Si queremos animar, es mejor usar withAnimation{}, como lo hemos hecho más abajo
            //.animation(.linear)
            //.animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
            .onTapGesture {
                //.response es la duración de la transición
                //.dampingFraction es la amortiguación o rebote de la transición
                //.blenDuration es la dureza en el cambio entre los 2 estados inicial y final. La suavidad
              /*  withAnimation(Animation.spring().repeatForever().delay(0.9)) { self.recording.toggle()
                }*/
                withAnimation(.spring(response: 0.3,dampingFraction: 0.3, blendDuration: 0.3)){
                    /*De esta forma, puedo excluir lo que no quiera animar, como por ejemplo el cambio de tamaño del corazón, simplemente sacándolo de las llaves*/
                    self.circleColorChanged.toggle()
                    self.heartColorChanged.toggle()
                    self.heartSizeChanged.toggle()
                    /*Si quiero que el corazón esté latiendo al pulsarlo: withAnimation(.spring(response: 0.3,dampingFraction: 0.3, blendDuration: 0.3).repeatForever().delay(0.9)){
                     Y solamente tedría que estar activo el : self.heartColorChanged.toggle()*/
                }
            }
            
            
            
            ZStack {
                Text("Cargando círculo animado!!")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -70)
        
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            Circle()
            .trim(from: 0, to: 0.2)
                //El círculo que se mueve, realmente es un borde relleno de verde
            .stroke(Color.green, lineWidth: 7)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses:false))
                .onAppear() {
                    self.isLoading = true
                }
            }
            .padding(30)
        }
    }
}

struct MoreAnimations_Previews: PreviewProvider {
    static var previews: some View {
        MoreAnimations()
    }
}
