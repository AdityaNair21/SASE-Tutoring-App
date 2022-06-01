//
//  File.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 4/26/22.
//

import Foundation
import SwiftUI


struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        AppView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
    
}

struct ProfileView: View {
    @ObservedObject var userSettings = UserSettings()
    
    @State private var showBioView = false
    @State private var showEmailView = false
    @State private var showPhoneView = false
    @State public var isShowingPhotoPicker = false
    @State public var pfpImage = UIImage(named: "pfp")!
//    @State public var bio = "My name is Roger and I am a freshman at SJSU studying computer science. I am currently looking for speech tutors as well as CS tutors for my CS 146 lab. I am also a tutor for CS46A and CS46B, so let me know if you need any help."
    
    var body: some View {
        
       // NavigationView{
            VStack{
                HStack{
                    VStack{
                        Image(uiImage: pfpImage)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                isShowingPhotoPicker = true
                            }
                        
                        Text(userSettings.name)
                            .fontWeight(.bold)
                            .font(.system(size:25))
                            .offset(x: 0, y: 0)
                            .padding(.top, 75)
                        
                        
                        Text(userSettings.role)
                            .font(.system(size:25))
                            .offset(x: 0, y: 0)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    VStack{
                        HStack{
                            Text("Classes")
                                .fontWeight(.bold)
                                .font(.system(size:30))
                                .offset(x: 0, y: 0)
                            
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.blue)
                        }
                        
                        ZStack{
                            
                            Rectangle()
                                .opacity(0.30)
                                .cornerRadius(15)
                                .foregroundColor(Color.gray)
                                .frame(height: 300)
                            
                            ScrollView{
                                HStack{
                                    Text("COMM 20")
                                        .font(.system(size:30))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("A. Mathews")
                                        .font(.system(size:20))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("CS 146")
                                        .font(.system(size:30))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("D. Taylor")
                                        .font(.system(size:20))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("AFAM 1")
                                        .font(.system(size:30))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("E. Watkins")
                                        .font(.system(size:20))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("CHEM 72")
                                        .font(.system(size:30))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("L. David")
                                        .font(.system(size:20))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("PHYS 172")
                                        .font(.system(size:30))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack{
                                    Text("G. Washington")
                                        .font(.system(size:20))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                               
                            }
                            .foregroundColor(Color.black)
                            .frame(height: 300)
                            
                        }
                        
                    }
                }
                Spacer()
                HStack{
                    Text("BIO")
                        .fontWeight(.bold)
                        .font(.system(size:30))
                        .offset(x: 0, y: 0)
                    
                    Button(action: {
                        self.showBioView.toggle()
                    }) {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.blue)
                    }
                    .fullScreenCover(isPresented: $showBioView){
                        ModifyBioView(bio : $userSettings.bio, startingBio: userSettings.bio)
                        
                    }
                        
                }
                
    
                
                Text(userSettings.bio)
                    .font(.system(size:20))
                    .offset(x: 0, y: 0)
                    .padding(.horizontal, 15)
                    
                
                Spacer();
                
                HStack(){
                    VStack{
                        HStack{
                            Text("Email")
                                .fontWeight(.bold)
                                .font(.system(size:20))
                                .offset(x: 0, y: 0)
                            
                            Button(action: {
                                self.showEmailView.toggle()
                            }) {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.blue)
                            }
                            .fullScreenCover(isPresented: $showEmailView){
                                ModifyEmailView(email : $userSettings.email, startingEmail: userSettings.email)
                            }

                            
                        }
                        
                        Text(userSettings.email)
                            .fontWeight(.bold)
                            .font(.system(size:15))
                            .offset(x: 0, y: -2)
                            .foregroundColor(Color.blue)
                    }
                    
                    VStack{
                        HStack{
                            Text("Phone Number")
                                .fontWeight(.bold)
                                .font(.system(size:20))
                                .offset(x: 0, y: 0)
                            
                            Button(action: {
                                self.showPhoneView.toggle()
                            }) {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.blue)
                            }
                            .fullScreenCover(isPresented: $showPhoneView){
                                ModifyPhoneView(phone : $userSettings.phoneNumber, startingPhone: userSettings.phoneNumber)
                            }
                        }
                        
                        Text(userSettings.phoneNumber)
                            .fontWeight(.bold)
                            .font(.system(size:15))
                            .offset(x: 0, y: -2)
                            .foregroundColor(Color.blue)
                    }
                }
                Spacer()
                
            }
        //}
        //.navigationBarBackButtonHidden(true)
        //.navigationBarHidden(true)
        .statusBar(hidden: true)
        .padding(.top, 75)
        .sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(pfpImage : $pfpImage)
        })
    }
}


struct ModifyBioView: View{
    @Binding var bio: String
    @State var startingBio: String
    
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
            TextEditor(text: $bio)
                .font(.system(size: 25))
                .frame(alignment: Alignment.center)
        }
            
    }
    func cancel(){
        bio = startingBio
        presentationMode.wrappedValue.dismiss()
    }

    func done(){

        presentationMode.wrappedValue.dismiss()

    }
}

struct ModifyEmailView: View{
    @Binding var email: String
    @State var startingEmail: String
    
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
            HStack{
                Spacer()
                Text("Email: ")
                    .font(.system(size: 25))
                    .padding(.leading, 45)
                
                TextField("", text: $email)
                    .font(.system(size: 25))
                    .frame(height: 30, alignment: Alignment.center)
                Spacer()
            }
            Spacer()
           
        }
            
    }
    func cancel(){
        email = startingEmail
        presentationMode.wrappedValue.dismiss()
    }

    func done(){

        presentationMode.wrappedValue.dismiss()

    }
}
    
    
    struct ModifyPhoneView: View{
        @Binding var phone: String
        @State var startingPhone: String
        
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
                HStack{
                    Spacer()
                    Text("Phone Number: ")
                        .font(.system(size: 25))
                        .padding(.leading, 25)
                    
                    TextField("", text: $phone)
                        .font(.system(size: 25))
                        .frame(height: 30, alignment: Alignment.center)
                    Spacer()
                }
                Spacer()
               
            }
                
        }
        func cancel(){
            phone = startingPhone
            presentationMode.wrappedValue.dismiss()
        }

        func done(){

            presentationMode.wrappedValue.dismiss()

        }
}


