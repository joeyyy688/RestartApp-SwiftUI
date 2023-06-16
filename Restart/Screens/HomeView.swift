//
//  HomeView.swift
//  Restart
//
//  Created by Joseph on 6/16/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = false
    
    var body: some View {
        
        VStack(spacing: 20){
            // MARK: - HEADER
            Spacer()
            
            ZStack{
                CircleGroupView(imageName: "character-2", shapeColor: .secondary, shapeOpacity: 0.1)
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
                isOnboardingViewActive = true
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
