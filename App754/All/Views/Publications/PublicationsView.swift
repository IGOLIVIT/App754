//
//  PublicationsView.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI

struct PublicationsView: View {
    
    @StateObject var viewModel = PublicationsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("My publications")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                   
                    VStack(spacing: 15) {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .regular))
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        
                        Text("\(viewModel.views)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                        
                        Text("Views")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .padding()
                    .frame(width: 120, height: 230)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                    
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Social network")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular))
                            
                            HStack {
                                
                                ForEach(viewModel.categories, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Image(index.catPhoto ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                        
                                    }
                                }
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddCategory = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                        .padding(13)
                                        .background(Circle().fill(Color("prim")))
                                })
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 130)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bgw")))
                        
                        NavigationLink(destination: {
                            
                            NotesView()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .regular))
                                    .padding(13)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                
                                Text("Write down a new idea!")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                            }
                            .padding()
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg3")))
                        })
                    }
                    
                }
                
                HStack {
                    
                    Text("History")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                    
                 Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                }
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentCartForFilter = index.catName ?? ""
                            
                        }, label: {
                            
                            Image(index.catPhoto ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .padding(3)
                                .background(Circle().fill(Color("prim").opacity(viewModel.currentCartForFilter == index.catName ?? "" ? 1 : 0)))
                        })
                    }
                    
                    Spacer()
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.histories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedHistory = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        
                                        Text(index.hisName ?? "")
                                            .foregroundColor(Color("bgw"))
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Text(index.hisDate ?? "")
                                            .foregroundColor(Color("bgw"))
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("bgw"))
                                        .font(.system(size: 17, weight: .medium))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPubl(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchHistorys()
        }
        .onAppear {
            
            viewModel.fetchHCategories()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PublDetail(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCategory ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCategory = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCategory = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Caegory")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                    
                    Menu(content: {
                        
                        ForEach(viewModel.cartoons, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentCart = index
                                
                            }, label: {
                                
                                Image(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentCart.isEmpty {
                            
                            VStack {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("Add image")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .padding(35)
                            .background(Circle().fill(Color("bg2")))
                            
                        } else {
                            
                            Image(viewModel.currentCart)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                        }
                    })
                    
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.catName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.catName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Button(action: {
                        
                        viewModel.catPhoto = viewModel.currentCart
                        
                        viewModel.addCategory()
                        
                        viewModel.catName = ""
                        viewModel.currentCart = ""
                        
                        viewModel.fetchHCategories()
          
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCategory = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        
                    })
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isAddCategory ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PublicationsView()
}
