//
//  Meetings.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 4/26/22.
//

import Foundation
import SwiftUI


struct ModifyMeetingView: View{
    @Binding var meetings: meeting
    @State var startingDate: Date
    let newDate: Date = Date()
    @State var startingTutor: String = ""
    
    @State private var notes: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack{
                Button("Cancel"){
                    cancel()
                }
                .padding(.leading, 20)
                Spacer()
                
                Button("Done"){
                    done()
                }
                .padding(.trailing, 20)
            }
            
            Spacer()
            Text(meetings.name)
            Text(meetings.location)
            
            Menu(meetings.tutor){
                Button("Hulk"){
                    
                }
                Button("Superman"){
                    startingTutor = meetings.tutor
                    meetings.setTutor(tutor: "Superman")
                }
                Button("Captain America"){
                    startingTutor = meetings.tutor
                    meetings.setTutor(tutor: "Captain America")
                }
                Button("Spiderman"){
                    startingTutor = meetings.tutor
                    meetings.setTutor(tutor: "Spiderman")
                }
                Button("Flash"){
                    startingTutor = meetings.tutor
                    meetings.setTutor(tutor: "Flash")
                }
                
            }
            
            
            
            
            
            DatePicker("Meeting Date/Time",selection: $meetings.date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                .padding(.horizontal, 10)
            //               TextField("Add meeting notes here", text: $notes)
            //                   .border(.black, width: 1)
            //                   .frame(minWidth: 250, maxWidth: 300, minHeight: 400, maxHeight: .infinity)
            
            
            TextEditor(text: $notes)
                .border(.black, width: 1)
                .frame(maxWidth: 350, minHeight: 200, idealHeight: 350, maxHeight: 350)
                .padding(.vertical, 25)
                .cornerRadius(10)
        }
        
    }
    func cancel(){
        meetings.setDate(date: startingDate)
        meetings.setTutor(tutor: startingTutor)
        presentationMode.wrappedValue.dismiss()
    }
    
    func done(){
        
        presentationMode.wrappedValue.dismiss()
        
    }
}




struct scheduledMeetingView: View {
    
    @State private var showMeetingView = false
    @State var testMeeting = meeting(
        name: "Diego",
        date: Date(),
        location: "San Jose",
        tutor: "George"
    )
    let formatter = DateFormatter()
    
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    HStack{
                        Text(testMeeting.name)
                        Divider()
                        Text(testMeeting.tutor)
                        
                        Divider()
                        
                        //formatter.dateStyle = .short
                        
                        Text("Room 2025")
                        
                    }
                    .padding(.top, 10)
                    
                    
                    Divider()
                    
                    HStack{
                        Text(testMeeting.date, style: .date)
                        Divider()
                        Text(testMeeting.date, style: .time)
                    }
                    .padding(.bottom, 10)
                    
                }
                
                Divider()
                Button(action: {
                    self.showMeetingView.toggle()
                }) {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .fullScreenCover(isPresented: $showMeetingView){
                    ModifyMeetingView(meetings: $testMeeting, startingDate: testMeeting.date, startingTutor: testMeeting.tutor)
                }
                .padding(.trailing, 10)
            }
            //.border(Color.black, width: 3)
            .padding(.all, 5)
            
            
            Rectangle()
                .opacity(0.30)
                .cornerRadius(20)
                .foregroundColor(Color.gray)
        }
    }
}

struct meeting {
    var name : String
    var date : Date
    var location: String
    var tutor : String
    
    mutating func setDate(date : Date){
        self.date = date
    }
    
    mutating func setTutor(tutor : String){
        self.tutor = tutor
    }
    
}



