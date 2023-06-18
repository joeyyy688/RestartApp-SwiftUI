//
//  OnboardingView.swift
//  Restart
//
//  Created by Joseph on 6/16/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding")  var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 40
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 10) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                        It's not how much we give but
                        how much we love we put into giving
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
                }//: VSTACK - HEADER
                
                // MARK: - CENTER
                
                ZStack{
                    CircleGroupView(imageName: "character-1", shapeColor: .white, shapeOpacity: 0.2)
                }//: ZSTACK - CENTER
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack{
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(x: 20)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                        .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .heavy))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    print(gesture.translation.width)
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{_ in
                                    if buttonOffset < (buttonWidth - 80) / 2{
                                        // meaning if the button hasn't crossed half the screen from the left to the right then,
                                        // reset the button position and bring back to it's default position
                                        buttonOffset = 0
                                    }else {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    }
                                    
                                }
                        )//: GESTURE
                        
                        
                        Spacer()
                    }
                    
                }//: ZSTACK - FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding(10)

            }//: VSTACK - BODY
        }//: ZSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
