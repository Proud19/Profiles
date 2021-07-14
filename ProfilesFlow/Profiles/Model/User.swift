//
//  User.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/8/21.
//

import Foundation

struct User {
    var userAttributes: [String: Any]
    
    init?(json: [String: Any]) {
        guard
            ((json["id"] as? Int) != nil),
            ((json["name"] as? String) != nil),
            ((json["gender"] as? String) != nil)
        else { return nil }
        self.userAttributes = json
    }
}
