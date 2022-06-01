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
                Image("icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(30)
                    .padding(.bottom, 25)
                    .padding(.top, 125)
                
                
                Text("Phoenix Guidance")
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


let tutors = ["John", "Hanna", "Edward", "Superman"]

