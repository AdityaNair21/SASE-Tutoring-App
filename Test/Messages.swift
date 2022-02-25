//
//  Messages.swift
//  SASE Tutoring App
//
//  Created by Angeli Faith Deanon on 2/24/22.
//

import SwiftUI

struct Messages: View {
    
    let chat: Chat
    
    var body: some View {
        HStack{
            Image(chat.person.imgString).resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            ZStack{
                VStack(alignment: .leading, spacing: 5)
                {
                    HStack{
                        Text(chat.person.name).bold()
                        Spacer()
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                    }
                    HStack{
                        Text(chat.messages.last?.text ?? "").foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
                Circle()
                    .foregroundColor(chat.hasUnReadMessage ? .blue : .clear)
                    .frame(width: 15, height: 15)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
        }
        .frame(height: 80)
    }
    
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages(chat: Chat.sampleChat[0])
    }
}
