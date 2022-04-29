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
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAppView = false
    
    @State private var Tutor:Bool = false
    @State private var Tutee:Bool = false
    
    @State private var passError = false
    @State private var errorMessage: String = ""
    
    @ObservedObject var userSettings = UserSettings()
    
    
    let textFieldColor = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    var body: some View {
        ScrollView{
        VStack{
            Text("Create Account")
                .fontWeight(.bold)
                .font(.system(size:30))
                .padding(.top, 25)
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
            
            VStack{
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
                    Image(systemName: "phone")
                        .foregroundColor(.secondary)
                    TextField("Phone Number", text: $phoneNumber)
                        .foregroundColor(Color.black)
                        .keyboardType(.phonePad)
                }
                .padding()
                .background(textFieldColor)
                .cornerRadius(10)
            }
            
            
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
//            NavigationLink(destination: AppView()){
//                Text("Register Now")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 355, height: 55)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//            .navigationBarTitle(Text(""))
//            .navigationTitle("")
//            .navigationBarHidden(true)
//            .statusBar(hidden: true)
//            .navigationBarBackButtonHidden(true)
            
            
            Button(action: {
                userSettings.email = email
                userSettings.name = firstName + " " + lastName
                userSettings.phoneNumber = phoneNumber
                if Tutor && Tutee {
                    userSettings.role = "Tutor/Tutee"
                }
                if Tutor && !Tutee {
                    userSettings.role = "Tutor"
                }
                if !Tutor && Tutee {
                    userSettings.role = "Tutee"
                }
                if password != confirmPassword {
                    errorMessage = "Passwords must match"
                    passError = true;
                } else if firstName.isEmpty || lastName.isEmpty || email.isEmpty || phoneNumber.isEmpty || password.isEmpty || confirmPassword.isEmpty{
                    errorMessage = "Fill in all fields"
                    passError = true;
                } else if !email.contains("@") || !email.contains("."){
                    errorMessage = "Enter a valid email"
                    passError = true;
                } else if phoneNumber.count < 10 || phoneNumber.count > 12{
                    errorMessage = "Enter a valid phone number"
                    passError = true;
                } else if password.count < 7{
                    errorMessage = "Password must be atleast 7 characters"
                    passError = true;
                } else if !password.contains("1") && !password.contains("2") && !password.contains("3") && !password.contains("4") && !password.contains("5") && !password.contains("6") && !password.contains("7") && !password.contains("8") && !password.contains("9") && !password.contains("0") {
                    errorMessage = "Password must contain at least one number"
                    passError = true;
                } else if !password.contains("!") && !password.contains("@") && !password.contains("#") && !password.contains("$") && !password.contains("%") && !password.contains("^") && !password.contains("&") && !password.contains("*") {
                    errorMessage = "Password must contain at least special character"
                    passError = true;
                } else {
                    self.showAppView.toggle()
                }
            }) {
                Text("Register Now")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 355, height: 55)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showAppView){
                AppView()
                
            }
            .alert(isPresented: $passError) {
                        Alert(title: Text(errorMessage), dismissButton: .default(Text("Ok")))
                    }
                
            
            
            
            
            HStack{
                Text("Already have an account?")
                    .font(.system(size: 17))
                //GOES BACK TO LOG-IN SCREEN
                NavigationLink(destination: ContentView()){
                    Text("Sign In!")
                        .font(.system(size: 17, weight: .bold))
                }
                .navigationBarTitle(Text(""))
                .navigationTitle("")
                .navigationBarHidden(true)
                .statusBar(hidden: true)
                .navigationBarBackButtonHidden(true)
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
    }
        //.navigationBarBackButtonHidden(true)
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
