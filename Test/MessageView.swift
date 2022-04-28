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
    
    @State private var text = ""
    @FocusState private var isFocused
    
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader {reader in
                ScrollView{
                    ScrollViewReader{ scrollReader in
                        getMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDToScroll){ _ in
                                if let messageID = messageIDToScroll{
                                    scrollTo(messageID: messageID, shouldAnnimate: true, scrollReader: scrollReader)

                                }
                            }
                    }
                }
            }
            toolBarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.markAsUnread(false, chat: chat)
        }
            
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnnimate: Bool, scrollReader: ScrollViewProxy){
            DispatchQueue.main.async {
                withAnimation(shouldAnnimate ? Animation.easeIn: nil){
                    scrollReader.scrollTo(messageID, anchor: anchor)
                }
            }
        }
    
    func toolBarView() -> some View {
        VStack {
            let height: CGFloat = 37
            HStack{
                TextField("Message...", text: $text)
                    .frame(height: height)
                    .background(Color.white)
                //can use clipShape & Rounded Rectangle command
                    .cornerRadius(13)
                    .focused($isFocused)
                    //.padding(.horizontal)
                //Spacer()
                Button(action: sendMessage){
                    Image(systemName: "paperplane.fill")
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage(){
        if let message = viewModel.sendMessage(text, in: chat){
            text = ""
            messageIDToScroll = message.id

        }
    }
    
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
                .id(message.id)
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

