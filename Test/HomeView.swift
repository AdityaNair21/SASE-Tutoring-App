//
//  HomeView.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 4/26/22.
//

import Foundation
import SwiftUI


struct HomeView: View {
    @State private var showHomeScreen = true
    @State private var showClassScreen = false
    
    @State var meetingList: [meeting] = []
    
    @State private var showMeetingView = false
    @State var testMeeting = meeting(
        subject: "Math 32",
        date: Date(),
        location: "Select Location",
        tutor: "Select Tutor",
        meetingNotes: ""
    )
    @State var m = meeting(subject: "", date: Date.now, location: "", tutor: "", meetingNotes: "")
    
    @State private var user: String = ""
    let names = ["Bob", "Joe", "Bill", "Sam"]
    let courses = ["Science", "Math", "English", "Chemistry"]
    
    var body: some View {
        NavigationView {
            VStack{
                
                HStack{
                    Text("Your Courses")
                        .fontWeight(.bold)
                        .offset(x:20)
                        .font(.system(size:30))
                    Spacer()
                }
                
                //Courses Buttons
                HStack{
                    Button(action: {
                    }) {
                        VStack{
                            Image("a1")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("a2")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    NavigationLink(destination: ClassView()){
                        VStack{
                            Image("a3")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    .navigationBarHidden(true)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("a4")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                }
                
                //Course Buttons 2
                HStack{
                    Button(action: {
                    }) {
                        VStack{
                            Image("a5")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("a6")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("a7")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("a8")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                }
                Spacer()
                
                //Scheduled Meetings Text
                HStack{
                    Text("Scheduled Meetings")
                        .fontWeight(.bold)
                        .offset(x:20)
                        .font(.system(size:30))
                    
                    
                    Button(action: {
                        m = meeting(subject: "Choose a Subject", date: Date.now, location: "", tutor: "Choose a Tutor", meetingNotes: "")
                        self.showMeetingView.toggle()
                        meetingList.append(m)
                    }) {
                        Image(systemName: "plus")
                        
                        
                    }
                    .fullScreenCover(isPresented: $showMeetingView){

                        ModifyMeetingView(meetings: $m, meetingList: $meetingList, startingDate: m.date, startingTutor: m.tutor, startingSubject: m.subject, startingLocation: m.location, startingMeetingNotes: m.meetingNotes)
                    }
                      .padding(.horizontal, 30)
                    
                    
                    Spacer()
                }
                
                //Meetings Listz
                ScrollView{
                    ForEach(meetingList, id: \.self) { meeting in
                        scheduledMeetingView(meetingList: $meetingList, meetingCurrent: meeting)
                    }
                }
                
                
            }
        }
        .statusBar(hidden: true)
        
        
    }
}


struct ContentView_Previews4: PreviewProvider {
    static var previews: some View {
        AppView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
    
}
