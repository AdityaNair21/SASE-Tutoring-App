//
//  SignUpView.swift
//  SASE Tutoring App
//
//  Created by Angeli Faith Deanon on 4/28/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var Tutor:Bool = false
    @State private var Tutee:Bool = false
    
    
    let textFieldColor = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    var body: some View {
        VStack{
            Text("Create Account")
                .fontWeight(.bold)
                .font(.system(size:30))
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.secondary)
                TextField("First Name", text: $firstName)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(textFieldColor)
            .cornerRadius(10)
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.secondary)
                TextField("Last Name", text: $lastName)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(textFieldColor)
            .cornerRadius(10)
            
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.secondary)
                TextField("Email", text: $email)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(textFieldColor)
            .cornerRadius(10)
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.secondary)
                TextField("Password", text: $password)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(textFieldColor)
            .cornerRadius(10)
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.secondary)
                TextField("Confirm Password", text: $confirmPassword)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(textFieldColor)
            .cornerRadius(10)
            Text("Choose what you would like to be")
                .padding()
            HStack{
                Spacer()
                Button(action: {
                    print("Round Action")
                    Tutor.toggle()
                }) {
                    
                    ZStack{
                        
                        Circle()
                            .frame(width: 110, height: 110)
                            .foregroundColor(Tutor ? Color.blue : Color.clear)
                        
                        Text("Tutor")
                            .frame(width: 100, height: 100)
                            .foregroundColor(Tutor ? Color.black : Color.white)
                            .background(Color.orange)
                            .font(.system(size:25))
//                            .opacity(Tutor ? 0.5 : 1)
                            .clipShape(Circle())
                        
                    }
                }
                Spacer()
                Button(action: {
                    print("Round Action")
                    Tutee.toggle()
                }) {
                    ZStack{
                        
                        Circle()
                            .frame(width: 110, height: 110)
                            .foregroundColor(Tutee ? Color.blue : Color.clear)
                        
                        Text("Tutee")
                            .frame(width: 100, height: 100)
                            .foregroundColor(Tutee ? Color.black : Color.white)
                            .background(Color.green)
                            .font(.system(size:25))
//                            .opacity(Tutee ? 0.5 : 1)
                            .clipShape(Circle())
                        
                        
                    }
                    
                    
                }
                Spacer()
//                Button(action: {
//                    print("Round Action")
//                }) {
//                    Text("Both")
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(Color.black)
//                        .background(Color.green)
//                        .clipShape(Circle())
//                }
            }
            .padding()
            NavigationLink(destination: AppView()){
                Text("Register Now")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 355, height: 55)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            HStack{
                Text("Already have an account?")
                    .font(.system(size: 17))
                //GOES BACK TO LOG-IN SCREEN
                NavigationLink(destination: ContentView()){
                    Text("Sign In!")
                        .font(.system(size: 17, weight: .bold))
                }
            }
            //self.mode.wrappedValue.dismiss()
        }
        .padding()
        //.offset(x: 0, y: 0)
        .navigationBarTitle(Text(""))
        .navigationTitle("")
        .navigationBarHidden(true)
        .statusBar(hidden: true)
        .navigationBarBackButtonHidden(true)
    }
        //.navigationBarBackButtonHidden(true)
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
