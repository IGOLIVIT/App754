//
//  Reviews.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color("bgw")
                .ignoresSafeArea()
            
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
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
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
