//
//  ChatsModel.swift
//  SASE Tutoring App
//
//  Created by Angeli Faith Deanon on 2/24/22.
//

import Foundation
struct Chat: Identifiable {
    var id: UUID{person.id}
    let person: Person
    var messages: [Message]
    var hasUnReadMessage = false
}
struct Person: Identifiable{
    let id = UUID()
    let name: String
    let imgString: String
}
struct Message: Identifiable{
    enum MessageType {
        case sent, received
    }
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date){
        self.text = text
        self.type = type
        self.date = date
    }
    
    init(_ text: String, type: MessageType){
        self.init(text, type: type, date: Date())
    }
}

extension Chat {
    static let sampleChat = [
        Chat(person: Person(name: "John", imgString: "pfp"), messages: [
            Message("Hi I need help with my homework. Can you help me?", type: .sent, date: Date(timeIntervalSinceNow: -86400*3)),
            Message("Hey, sure what do you need help on?", type: .received, date: Date(timeIntervalSinceNow: -86400*0))
        ], hasUnReadMessage: true),
        Chat(person: Person(name: "Sam", imgString: "pfp"), messages: [
            Message("Hi I need help with my homework. Can you help me?", type: .sent, date: Date(timeIntervalSinceNow: -86400*3)),
            Message("Do you have the notes for our math class?", type: .received, date: Date(timeIntervalSinceNow: -86400*0))
        ], hasUnReadMessage: true),
        Chat(person: Person(name: "Hanna", imgString: "pfp"), messages: [
            Message("Hi this is Hanna", type: .sent, date: Date(timeIntervalSinceNow: -86400*3)),
            Message("Do you need help?", type: .received, date: Date(timeIntervalSinceNow: -86400*1))
        ], hasUnReadMessage: false),
        
        Chat(person: Person(name: "Bob", imgString: "pfp"), messages: [
            Message("Hey", type: .sent, date: Date(timeIntervalSinceNow: -86400*9)),
            Message("I'm free today at 10am.", type: .received, date: Date(timeIntervalSinceNow: -86400*2))
        ], hasUnReadMessage: false),
        
        Chat(person: Person(name: "Superman", imgString: "pfp"), messages: [
            Message("Hey", type: .sent, date: Date(timeIntervalSinceNow: -86400*7)),
            Message("What time are you free on Tuesdays?", type: .received, date: Date(timeIntervalSinceNow: -86400*4))
        ], hasUnReadMessage: false),
        
        Chat(person: Person(name: "Flash", imgString: "pfp"), messages: [
            Message("Hey", type: .sent, date: Date(timeIntervalSinceNow: -86400*10)),
            Message("I'm here at the library.", type: .received, date: Date(timeIntervalSinceNow: -86400*6))
        ], hasUnReadMessage: false),
        
        Chat(person: Person(name: "Joe", imgString: "pfp"), messages: [
            Message("Hey", type: .sent, date: Date(timeIntervalSinceNow: -86400*13)),
            Message("Thanks for the help!", type: .received, date: Date(timeIntervalSinceNow: -86400*8))
        ], hasUnReadMessage: false),
        
        Chat(person: Person(name: "Catherine", imgString: "pfp"), messages: [
            Message("Hey", type: .sent, date: Date(timeIntervalSinceNow: -86400*13)),
            Message("Thanks for the help!", type: .received, date: Date(timeIntervalSinceNow: -86400*9))
        ], hasUnReadMessage: false)
    ]
}

