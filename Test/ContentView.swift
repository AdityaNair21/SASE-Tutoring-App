//
//  ContentView.swift
//  Test
//
//  Created by Aditya Nair on 1/27/22.
//

import SwiftUI


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        AppView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
    
}



struct ContentView: View {
    
    
    @State private var user: String = ""
    @State private var password: String = ""
    
    let textFieldColor = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    var body: some View {
        NavigationView{
            
            VStack{
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(30)
                    .padding(.bottom, 25)
                    .padding(.top, 125)
                
                
                Text("Tutoring App Name")
                    .fontWeight(.bold)
                    .font(.system(size:30))
                
                
                
                HStack {
                    TextField("Username", text: $user)
                        .padding()
                        .background(textFieldColor)
                        .cornerRadius(15)
                        .font(Font.system(size: 20))
                }
                .padding(10)
                
                HStack {
                    SecureField("Password", text: $password)
                        .padding()
                        .background(textFieldColor)
                        .cornerRadius(15)
                        .font(Font.system(size: 20))
                }
                .padding(10)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: AppView()){
                        Text("Sign In")
                    }
                    .navigationBarTitle(Text(""))
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    .navigationBarBackButtonHidden(true)
                    Spacer()
                    
                    NavigationLink(destination: SignUpView()){
                        Text("Sign Up")
                    }
                    .navigationBarTitle(Text(""))
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    .navigationBarBackButtonHidden(true)
                    .colorInvert()
                    
                    Spacer()
                    
                }
                .padding(.top, 100)
                .padding(.bottom, 200)
            }
        }
        .navigationBarTitle(Text(""))
        .navigationTitle("")
        .navigationBarHidden(true)
        .statusBar(hidden: true)
        .navigationBarBackButtonHidden(true)
    }
}

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
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    .navigationBarBackButtonHidden(true)
                    
                    
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

//struct SearchBar: UIViewRepresentable {
//
//}


let tutors = ["John", "Hanna", "Edward", "Superman"]


struct ClassView: View {
    
    var body: some View {
        
        VStack{
            //Text("Hi")
            //            Menu("Options"){
            //                Button("Order", action: testfunc)
            //                TextField("", text: $user)
            //                Button("Submit", action: testfunc)
            //            }
            
            
        }
    }
    
    func testfunc(){
        
    }
}


struct ChatView: View{
    @State var viewModel = ChatsViewModel()
    @State var test = 1
    @State private var query =  ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.getSortedFilteredCharts(query: query)){ chat in
                    ZStack{
                        Messages(chat: chat, test: $test)
                        NavigationLink(destination: { MessageView(chat: chat, test: $test)
                                .environmentObject(viewModel)
                        }) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
            },trailing: Button(action: {}){
                Image(systemName: "square.and.pencil")
            })
        }.navigationBarBackButtonHidden(true)
        
    }
}

