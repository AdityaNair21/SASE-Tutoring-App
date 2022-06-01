//
//  AppView.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 5/31/22.
//

import Foundation
import SwiftUI

struct AppView: View {
    @ObservedObject var userSettings = UserSettings()
    @State private var showHomeScreen = true
    @State private var showClassScreen = false
    
    
    @State private var user: String = ""
    let names = ["Bob", "Joe", "Bill", "Sam"]
    let courses = ["Science", "Math", "English", "Chemistry"]
    
    var body: some View {
        NavigationView {
            VStack{
                
                //Top Bar
                HStack{
                    //                List{
                    //                    Text("hi")
                    //                    if(false){
                    //                        ForEach(results , id: \.self) { name in
                    //                            NavigationLink(destination: Text(name)){
                    //                                Text(name)
                    //                            }
                    //                        }
                    //                    } else {
                    //                        ForEach(results2 , id: \.self) { course in
                    //                            NavigationLink(destination: Text(course)){
                    //                                Text(course)
                    //                            }
                    //                        }
                    //                    }
                    //
                    //                }
                    //                .searchable(text: $searchingFor, placement: .navigationBarDrawer(displayMode: .always))
                    
                    NavigationLink(destination: ProfileView()){
                        Image("pfp")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.horizontal, 20)
                    .navigationBarTitle(Text(""))
                    .navigationTitle("")
                    //.navigationBarHidden(true)
                    //.statusBar(hidden: true)
                    //.navigationBarBackButtonHidden(true)
                    
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .padding(.all, 3)
                        TextField("Search", text: $user)
                            .font(.system(size:20))
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    NavigationLink(destination: ChatView()){
                        Image(systemName: "message.fill")
                    }
                    .navigationBarTitle(Text(""))
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    .navigationBarBackButtonHidden(true)
                    .padding(.horizontal, 20)
                }
                .padding(.top, 50)
                
                
                HomeView()
                
                Spacer()
                
                Divider()
                HStack{
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "house.fill")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "bell.fill")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "video.fill")
                    }
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "calendar")
                    }
                    Spacer()
                }
                .offset(x: 0, y: 15)
                
                
            }
        }
        .navigationBarTitle(Text(""))
        .navigationTitle("")
        .navigationBarHidden(true)
        .statusBar(hidden: true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    //    Search Testing
    //    var results: [String] {
    //        if searchingFor.isEmpty {
    //            return names
    //        } else {
    //            return names.filter { $0.contains(searchingFor)}
    //        }
    //    }
    //
    //    var results2: [String] {
    //        if searchingFor.isEmpty {
    //            return courses
    //        } else {
    //            return courses.filter { $0.contains(searchingFor)}
    //        }
    //    }
    
}

