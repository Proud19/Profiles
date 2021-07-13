//
//  User.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/8/21.
//

import Foundation

struct User {
    var id: String
    var name: String
    var gender: String
    var about: String?
    var photo: String?
    var school: String?
    var hobbies: [String]?
    
    init(id: String, name: String, gender: String, about: String?, photo: String?, school: String?, hobbies: [String]?) {
        self.id = id
        self.name = name
        self.gender = gender
        self.about = about
        self.photo = photo
        self.school = school
        self.hobbies = hobbies
    }
    
    init?(json: [String: Any]) {
        guard
            let id = json["id"] as? String,
            let name = json["name"] as? String,
            let gender = json["gender"] as? String
        else { return nil }
        
        self.id = id
        self.name = name
        self.gender = gender
        self.about = json["about"] as! String?
        self.photo = json["photo"] as! String?
        self.school = json["school"] as! String?
        self.hobbies = json["hobbies"] as! [String]?
    
    }
    
}
