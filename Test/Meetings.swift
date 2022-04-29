//
//  Meetings.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 4/26/22.
//

import Foundation
import SwiftUI

struct ContentView_Previews3: PreviewProvider {
    static var previews: some View {
        AppView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
    
}



struct ModifyMeetingView: View{
    @Binding var meetings: meeting
    @Binding var meetingList: [meeting]
    @State var startingDate: Date
    @State private var confirmationShown = false;
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
                
                ZStack{
                    
                    Rectangle()
                        .opacity(0.90)
                        .frame(width: 75, height: 35)
                        .cornerRadius(10)
                        .foregroundColor(Color.red)
                    
                    Button("Delete"){
                        confirmationShown.toggle()
                    }
                    .foregroundColor(Color.white)
                    .confirmationDialog(
                                                "Are you sure you want to delete this schedule?",
                                                 isPresented: $confirmationShown
                                            ) {
                                                Button("Delete") {
                                                    withAnimation {
                                                        delete()
                                                    }
                                                }
                                                .foregroundColor(Color.red)
                                            }
                }
                
                Spacer()
                
                Button("Done"){
                    done()
                }
                .padding(.trailing, 20)
            }
            
            Spacer()
            Text(meetings.name)
            
            Text(meetings.location)
            
            ZStack{
                
                Rectangle()
                    .opacity(0.30)
                    .cornerRadius(20)
                    .frame(height: 65)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.horizontal, 10)
                
                HStack{
                    Text("Meeting Location: ")
                    TextField("Choose a Location", text: $meetings.location)
                        .frame(width: 150)
                }
            }
            
            ZStack{
                
                Rectangle()
                    .opacity(0.30)
                    .cornerRadius(20)
                    .frame(height: 65)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.horizontal, 10)
                
                HStack{
                    Text("Choose a Tutor: ")
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
                }
            }
            
            
            
            
            
            ZStack{
                
                Rectangle()
                    .opacity(0.30)
                    .cornerRadius(20)
                    .frame(height: 65)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.horizontal, 10)
                
                DatePicker("Meeting Date/Time",selection: $meetings.date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .padding(.horizontal, 25)
                //               TextField("Add meeting notes here", text: $notes)
                //                   .border(.black, width: 1)
                //                   .frame(minWidth: 250, maxWidth: 300, minHeight: 400, maxHeight: .infinity)
                
            }
                
            
            ZStack{
                
                Rectangle()
                    .opacity(0.30)
                    .cornerRadius(20)
                    .frame(height: 425)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.horizontal, 10)
                
                VStack{
                    
                    Text("Meeting Notes")
                    
                    TextEditor(text: $notes)
                            .frame(maxWidth: 350, minHeight: 200, idealHeight: 350, maxHeight: 350)
                            .padding(.bottom, 25)
                            .cornerRadius(10)
                            .foregroundColor(Color.clear)
                }
                
            }
            
        
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
    
    func delete(){
        meetingList.removeLast()
        presentationMode.wrappedValue.dismiss()
        
    }
}




struct scheduledMeetingView: View {
    @Binding var meetingList: [meeting]
    @State private var showMeetingView = false
    @State var meetingCurrent: meeting
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
                        Text(meetingCurrent.name)
                        Divider()
                        Text(meetingCurrent.tutor)
                        
                        Divider()
                        
                        //formatter.dateStyle = .short
                        
                        Text(meetingCurrent.location)
                        
                    }
                    .padding(.top, 10)
                    
                    
                    Divider()
                    
                    HStack{
                        Text(meetingCurrent.date, style: .date)
                        Divider()
                        Text(meetingCurrent.date, style: .time)
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
                    ModifyMeetingView(meetings: $meetingCurrent, meetingList: $meetingList, startingDate: meetingCurrent.date, startingTutor: meetingCurrent.tutor)
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

struct meeting : Hashable{
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
    
    mutating func setLocation(location : String){
        self.location = location
    }
    
}



