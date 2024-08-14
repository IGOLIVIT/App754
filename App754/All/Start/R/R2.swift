//
//  R2.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bgw")
                .ignoresSafeArea()
            
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Convenient functionality")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    R2()
}
