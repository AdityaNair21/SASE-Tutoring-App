//
//  MessageView.swift
//  SASE Tutoring App
//
//  Created by Angeli Faith Deanon on 2/25/22.
//

import SwiftUI

struct MessageView: View {
    @EnvironmentObject var viewModel: ChatsViewModel
    let chat: Chat
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader {reader in
                ScrollView{
                    getMessagesView(viewWidth: reader.size.width)
                }.padding(.horizontal)
                    //.toolBarView()
                
            }
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        //.onAppear {
            
    }
    
    /*func toolBarView() -> some View {
        VStack {
            Text("Toolbar")
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
     */
    
    let columns = [GridItem(.flexible(minimum: 10))]
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0)
        {
            ForEach(chat.messages) { message in
                let isReceived = message.type == .received;
                HStack {
                    ZStack {
                        Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9))
                            .cornerRadius(13)
                    }.frame(width: viewWidth * 0.7, alignment: isReceived ? .leading: .trailing)
                    .padding(.vertical)
                    //.background(Color.blue)
                    
                }
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading: .trailing)
                .id(message.id) //
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(chat: Chat.sampleChat[0])
            .environmentObject(ChatsViewModel())
    }
}
