//
//  ChatView.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 5/31/22.
//

import Foundation
import SwiftUI

struct ChatView: View{
    @State var viewModel = ChatsViewModel()
    @State var test = 1
    @State private var query =  ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            List {
                ForEach(viewModel.getSortedFilteredCharts(query: query)){ chat in
                    ZStack{
                        Messages(chat: chat, test: $test)
                        NavigationLink(destination: { MessageView(chat: chat, test: $test)
                                .environmentObject(viewModel)
                        }) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {}){
                Image(systemName: "square.and.pencil")
            })
        
    }
}
