//
//  AddNote.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: NotesViewModel
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
                        
                        viewModel.addNote()
                        
                        viewModel.notName = ""
                        viewModel.notDate = ""
                        viewModel.notDescr = ""
                        
                        viewModel.fetchNotes()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.notName.isEmpty || viewModel.notDate.isEmpty || viewModel.notDescr.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.notName.isEmpty || viewModel.notDate.isEmpty || viewModel.notDescr.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.notName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notName)
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
                                    .opacity(viewModel.notDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notDate)
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
                                    .opacity(viewModel.notDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notDescr)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddNote(viewModel: NotesViewModel())
}
