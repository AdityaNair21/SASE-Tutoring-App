//
//  ChatsViewModel.swift
//  SASE Tutoring App
//
//  Created by Angeli Faith Deanon on 2/25/22.
//

import Foundation

class ChatsViewModel: ObservableObject{
    @Published var chats = Chat.sampleChat
    @Published var refresh: Int = 0
    
    
    func getSortedFilteredCharts(query: String) -> [Chat] {
        refresh = refresh + 1
        let sortedChats = chats.sorted{
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter{$0.person.name.lowercased().contains(query.lowercased())}
    }
    
    func markAsUnread(_ newValue: Bool, chat: Chat){
        refresh = refresh + 1
        if let index = chats.firstIndex(where: {$0.id == chat.id}){
            chats[index].hasUnReadMessage = newValue
        }
    }
    
    func sendMessage(_ text: String, in chat: Chat) -> Message?{
        refresh = refresh + 1
        if let index = chats.firstIndex(where: {$0.id == chat.id}) {
            let message = Message(text, type: .sent)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
}
    
