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
    var school: String?
    var hobbies: String?
    
    init(id: String, name: String, gender: String) {
        self.id = id
        self.name = name
        self.gender = gender
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
        
    }
}
