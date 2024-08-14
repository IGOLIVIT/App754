//
//  R1.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bgw")
                .ignoresSafeArea()
            
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("The ability to edit and delete entries")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                
            }
            .padding()

        }
    }
}

#Preview {
    R1()
}
