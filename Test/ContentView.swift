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
        AppView()
        //ChatView()
        //HomeView()
        ClassView()
    }
}


 
struct ContentView: View {
    
    
    @State private var user: String = ""
    @State private var password: String = ""
    
    var body: some View {
       
        
        NavigationView{
        
            VStack{
                Image("bus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(30)
                    .padding(.bottom, 25)
                Text("Tutoring App Name")
                    .padding(.bottom, 75)
                
                HStack {
                    Text("Username")
                    TextField("", text: $user)
                        .border(Color(UIColor.separator))
                }
                .padding(10)

                HStack {
                    Text("Password")
                    SecureField("Password", text: $password)
                        .border(Color(UIColor.separator))
                        
                }
                .padding(10)
                
                HStack {
//                    NavigationLink(destination: MainView()){
//                      Text("Sign In")
//                    }
//                        .navigationBarHidden(true)
//                        .navigationBarBackButtonHidden(true)
                    
                    
                    
                    Button("Sign Up", action: {
                      print("Hello")
                    })
                        .padding(.horizontal, 50)
                }
                .padding(.top, 100)
                .padding(.bottom, 200)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AppView: View {
    
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
                        .navigationBarHidden(true)
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
                        Image(systemName: "bell.fill")
                    }
          
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "folder.fill")
                    }
                   
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "video.fill")
                    }
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "message.fill")
                    }
                    Spacer()
                }
                .padding(.vertical, 5)
                
                
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

struct HomeView: View {
    @State private var showHomeScreen = true
    @State private var showClassScreen = false
    
   
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
                                    }) {
                                        Image(systemName: "plus")
                                    }
                                        .padding(.horizontal, 30)
                                    
                                    
                                    Spacer()
                                }
                                
                                //Meetings List
                                ScrollView{
                                                                   
                                    scheduledMeetingView()
                                    
                                    scheduledMeetingView()
                                    scheduledMeetingView()
                                }

                
            }
        }
        .statusBar(hidden: true)

            
    }
}

struct ProfileView: View {
    @State private var isShowingPhotoPicker = false
    @State private var pfpImage = UIImage(named: "pfp")!
    
    var body: some View {

        NavigationView{
            VStack{
                Text("Profile")
                    .fontWeight(.bold)
                    .font(.system(size:30))
                    .offset(x: -100, y: 0)


                Image(uiImage: pfpImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        isShowingPhotoPicker = true
                    }

                Spacer()


            }
        }
            //.navigationBarBackButtonHidden(true)
            //.navigationBarHidden(true)
            //.statusBar(hidden: true)
            .padding(.top, 100)
        .sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(pfpImage: $pfpImage)
        })
    }
}

struct scheduledMeetingView: View {
    
    @State private var showMeetingView = false
    
    
    
    @State var testMeeting = meeting(
            name: "Diego",
            date: Date(),
            location: "San Jose"
        )
    
    let formatter = DateFormatter()
    
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    HStack{
                        Text("Bobby")
                        Divider()
                        Text("Chemistry")
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
                        ModifyMeetingView(meetings: $testMeeting)
                    }
                    .padding(.trailing, 10)
            }
            //.border(Color.black, width: 3)
            .padding(.all, 5)
            
            
            Rectangle()
                .opacity(0.25)
                .cornerRadius(25)
        }
    }
}

struct meeting {
    var name : String
    var date : Date
    var location: String
}

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

struct ModifyMeetingView: View{
    @Binding var meetings: meeting
    
    let startingDate: Date = Date()
    @State private var notes: String = ""
    @Environment(\.presentationMode) var presentationMode
    
//
//    let dateRange: PartialRangeFrom<Date> = {
//        let calendar = Calendar.current
//        return Date()...
//
//    }()
//
   
    
    
      var body: some View {
           VStack {
               HStack{
                   Button("Done"){
                       presentationMode.wrappedValue.dismiss()
                   }
                   .padding(.leading, 20)
                   Spacer()
               }
               
               Spacer()
               Text(meetings.name)
               Text(meetings.location)
               DatePicker("Meeting Date/Time",selection: $meetings.date, in: startingDate..., displayedComponents: [.date, .hourAndMinute])
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
}

struct ChatView: View {
    @State private var user: String = ""
    
    var body: some View {
        Text("Hi")
    }
    
}


