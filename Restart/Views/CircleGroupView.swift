//
//  CircleGroupView.swift
//  Restart
//
//  Created by Joseph on 6/16/23.
//

import SwiftUI

struct CircleGroupView: View {
    var imageName: String
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            CircleGroupView(imageName: "character-1", shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
