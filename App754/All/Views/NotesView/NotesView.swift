//
//  NotesView.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI

struct NotesView: View {

    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("My notes")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        VStack(spacing: 16) {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                                .padding(13)
                                .background(Circle().fill(Color("prim")))
                            
                            Text("New note")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("bgw")))
                    })
                    .padding(1)
                    
                    ForEach(viewModel.notes, id: \.self) { index in
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.notName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text(index.notDescr ?? "")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                Text(index.notDate ?? "")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 11, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        })
                    }
                }
                
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
    }
}

#Preview {
    NotesView()
}
