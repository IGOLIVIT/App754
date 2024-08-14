//
//  PublDetail.swift
//  App754
//
//  Created by IGOR on 07/08/2024.
//

import SwiftUI

struct PublDetail: View {
    
    @StateObject var viewModel: PublicationsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()

                }
                .padding(.bottom)
                
                HStack {
                    
                    Image(viewModel.selectedHistory?.hisCartPhoto ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                    
                    Text(viewModel.selectedHistory?.hisCart ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .medium))
                }
                .padding(2)
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text(viewModel.selectedHistory?.hisName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedHistory?.hisDate ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text(viewModel.selectedHistory?.hisDescr ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            VStack(spacing: 15) {
                                
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                
                                Text("\(viewModel.selectedHistory?.hisLikes ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Likes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                            
                            VStack(spacing: 15) {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                
                                Text("\(viewModel.selectedHistory?.hisViews ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Views")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                            
                            VStack(spacing: 15) {
                                
                                Image(systemName: "pencil")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                
                                Text("\(viewModel.selectedHistory?.hisComments ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Comments")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        }
                    }
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    PublDetail(viewModel: PublicationsViewModel())
}
