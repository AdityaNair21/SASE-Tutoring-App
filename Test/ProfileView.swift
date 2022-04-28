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
    @State public var isShowingPhotoPicker = false
    @State public var pfpImage = UIImage(named: "pfp")!
    
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
                        
                        Text("Roger")
                            .fontWeight(.bold)
                            .font(.system(size:25))
                            .offset(x: 0, y: 0)
                            .padding(.top, 75)
                        
                        
                        Text("Tutor/Tutee")
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
                    
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color.blue)
                }
                
    
                
                Text("My name is Roger and I am a freshman at SJSU studying computer science. I am currently looking for speech tutors as well as CS tutors for my CS 146 lab. I am also a tutor for CS46A and CS46B, so let me know if you need any help.")
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
                            
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.blue)
                        }
                        
                        Text("roger.smith@sjsu.edu")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                            .offset(x: 0, y: -2)
                    }
                    
                    VStack{
                        HStack{
                            Text("Phone Number")
                                .fontWeight(.bold)
                                .font(.system(size:20))
                                .offset(x: 0, y: 0)
                            
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.blue)
                        }
                        
                        Text("123-456-7890")
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
            PhotoPicker(pfpImage: $pfpImage)
        })
    }
}
