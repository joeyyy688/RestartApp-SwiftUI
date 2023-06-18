//
//  HomeView.swift
//  Restart
//
//  Created by Joseph on 6/16/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20){
            // MARK: - HEADER
            Spacer()
            
            ZStack{
                CircleGroupView(shapeColor: .secondary, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 20 : -20)
                    .animation(Animation.easeInOut(duration: 3) .repeatForever(), value: isAnimating)
            }//: ZSTACK - HEADER
            
            
            // MARK: - CENTER
            VStack(spacing: 0){
                Text("""
                    The time that leads to mastery is
                    dependent on the intensity of our focus
                    """)
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                
            } // VStack - CENTER
            
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeIn(duration: 0.5)){
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            
        }//: VSTACK - BODY
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
