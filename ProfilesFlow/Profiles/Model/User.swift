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
        rectifyGender()
    }
    
    init?(json: [String: Any]) {
        print(json)
        guard
            let id =  json["id"] as? String,
            let name = json["name"] as? String,
            let gender = json["gender"] as? String
        else { return nil }
        print(name)
        self.id = id
        self.name = name
        self.gender = gender
        self.about = json["about"] as! String?
        self.photo = json["photo"] as! String?
        self.school = json["school"] as! String?
        self.hobbies = json["hobbies"] as! [String]?
        rectifyGender()
    }
     
    var displayableFields: [String] {
        var fields: [String] = []
        fields.append("name")
        if (self.photo != nil) {
            fields.append("photo")
        }
        fields.append("gender")
        if (self.about != nil) {
            fields.append("about")
        }
        if (self.school != nil) {
            fields.append("school")
        }
        if (self.hobbies != nil) {
            fields.append("hobbies")
        }
        return fields
    }
    
    mutating func rectifyGender() {
        if self.gender == "f" {
            self.gender = "Female"
        } else {
            self.gender = "Male"
        }
    }
    
}
