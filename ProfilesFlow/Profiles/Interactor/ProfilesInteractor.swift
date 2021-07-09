//
//  ProfilesInteractor.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/9/21.
//

import Foundation

class ProfilesInteractor: ProfilesInteractorType {
   
    private var _usersArray: [User] = []
    
    init() {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let allUsers = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String: [AnyObject]]
            let tempUsersArray = allUsers["users"]!
            for user in tempUsersArray {
                let id = String(describing: user["id"])
                let name = user["name"] as! String
                let gender = user["gender"] as! String
                self._usersArray.append(User(id: id, name: name, gender: gender))
            }
            print("Successfully initilized interactor...\nWe have \(self._usersArray.count) users in the system.")
        } catch {
            print("Error!! Unable to parse")
        }
    }
}

extension ProfilesInteractor {
    var usersArray: [User] {
        return self._usersArray
    }
}

