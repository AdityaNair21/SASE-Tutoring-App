//
//  UserInfo.swift
//  SASE Tutoring App
//
//  Created by Aditya Nair on 4/27/22.
//

import Foundation
import Combine
import UIKit

class UserSettings: ObservableObject {
    @Published var bio: String {
         didSet {
             UserDefaults.standard.set(bio, forKey: "bio")
         }
    }
    
    @Published var name: String {
         didSet {
             UserDefaults.standard.set(name, forKey: "name")
         }
    }
    
    @Published var role: String {
         didSet {
             UserDefaults.standard.set(role, forKey: "role")
         }
    }
        
    @Published var phoneNumber: String {
        didSet {
            UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        }
    }
    
    @Published var email: String {
       didSet {
            UserDefaults.standard.set(email, forKey: "email")
       }
    }
    
    @Published var pfp: UIImage {
       didSet {
            UserDefaults.standard.set(pfp, forKey: "pfp")
       }
    }
    
    init() {
        self.bio = UserDefaults.standard.object(forKey: "bio") as? String ?? "My name is Roger and I am a freshman at SJSU studying computer science. I am currently looking for speech tutors as well as CS tutors for my CS 146 lab. I am also a tutor for CS46A and CS46B, so let me know if you need any help."
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? "Roger"
        self.phoneNumber = UserDefaults.standard.object(forKey: "phoneNumber") as? String ?? "123-456-7890"
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? "roger.smith@sjsu.edu"
        self.role = UserDefaults.standard.object(forKey: "role") as? String ?? "Tutee"
        self.pfp = UserDefaults.standard.object(forKey: "pfp") as? UIImage ?? UIImage(named: "bus")!
    }
    
    
}
