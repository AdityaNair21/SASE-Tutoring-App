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
    
    @State private var showMeetingView = false
    @State var testMeeting = meeting(
        name: "Diego",
        date: Date(),
        location: "Select Location",
        tutor: "Select Tutor"
    )
    
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
                            Image("pfp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("pfp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    NavigationLink(destination: ClassView()){
                        VStack{
                            Image("pfp")
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
                            Image("pfp")
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
                            Image("pfp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("pfp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("pfp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Math")
                        }
                    }
                    .padding(.horizontal, 18)
                    
                    Button(action: {
                    }) {
                        VStack{
                            Image("pfp")
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
                        self.showMeetingView.toggle()
                    }) {
                        Image(systemName: "plus")
                        
                        
                    }
                    .fullScreenCover(isPresented: $showMeetingView){
                        ModifyMeetingView(meetings: $testMeeting, startingDate: testMeeting.date)
                    }
                    .padding(.horizontal, 30)
                    
                    
                    Spacer()
                }
                
                //Meetings Listz
                ScrollView{
                    
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                    scheduledMeetingView()
                }
                
                
            }
        }
        .statusBar(hidden: true)
        
        
    }
}
