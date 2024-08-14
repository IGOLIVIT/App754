//
//  AddPubl.swift
//  App754
//
//  Created by IGOR on 07/08/2024.
//

import SwiftUI

struct AddPubl: View {

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
                    
                    Button(action: {
                        
                        viewModel.views += Int(viewModel.hisViews) ?? 0
                        
                        viewModel.hisCart = viewModel.currentCart
                        viewModel.hisCartPhoto = viewModel.currentCartPhoto
                        
                        viewModel.addHistory()
                        
                        viewModel.hisName = ""
                        viewModel.hisDate = ""
                        viewModel.hisDescr = ""
                        viewModel.hisLikes = ""
                        viewModel.hisViews = ""
                        viewModel.hisComments = ""
                        
                        viewModel.fetchHistorys()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.hisName.isEmpty || viewModel.hisDate.isEmpty || viewModel.hisDescr.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.hisName.isEmpty || viewModel.hisDate.isEmpty || viewModel.hisDescr.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.categories, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentCart = index.catName ?? ""
                                        viewModel.currentCartPhoto = index.catPhoto ?? ""
                                        
                                    }, label: {
                                        
                                        VStack {
                                            
                                            Image(index.catPhoto ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 55)
                                                .padding(3)
                                                .background(Circle().fill(Color("prim").opacity(viewModel.currentCart == index.catName ?? "" ? 1 : 0)))
                                            
                                            Text(index.catName ?? "")
                                                .foregroundColor(viewModel.currentCart == index.catName ?? "" ? Color("prim") : .white)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    })
                                }
                            }
                        }
                        .frame(height: 80)
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Text("Date")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisDate)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisDescr)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Likes")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Text")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.hisLikes.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.hisLikes)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                            
                            VStack {
                                
                                Text("Views")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Text")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.hisViews.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.hisViews)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                            
                            VStack {
                                
                                Text("Comments")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Text")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.hisComments.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.hisComments)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                            
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHCategories()
        }
    }
}

#Preview {
    AddPubl(viewModel: PublicationsViewModel())
}
