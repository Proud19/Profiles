//
//  ProfilesInteractor.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/9/21.
//

import Foundation

class ProfilesInteractor: ProfilesInteractorType {
   
    private var _usersArray: [User] = []
    private var _configOrder: [String] = [] //might want to provide a default order if none is given
    
    init() {
        guard let profilesUrl = Bundle.main.url(forResource: "users", withExtension: "json") else { return }
        guard let configUrl = Bundle.main.url(forResource: "config", withExtension: "json") else { return }
        do {
            let profilesData = try Data(contentsOf: profilesUrl)
            let configData = try Data(contentsOf: configUrl)
            
            let allUsers = try JSONSerialization.jsonObject(with: profilesData, options: JSONSerialization.ReadingOptions()) as! [String: [AnyObject]]
            let tempConfigOrder = try JSONSerialization.jsonObject(with: configData, options: JSONSerialization.ReadingOptions()) as! [String: [String]]
             
            for user in allUsers["users"]! {
                let id = String(describing: user["id"])
                let name = user["name"] as! String
                let gender = user["gender"] as! String
                let photo = user["photo"] as! String?
                let about = user["about"] as! String?
                let school = user["school"] as! String?
                let hobbies = user["hobbies"] as! [String]?
                self._usersArray.append(User(id: id, name: name, gender: gender, about: about, photo: photo, school: school, hobbies: hobbies))
            }
            self._configOrder = tempConfigOrder["profile"]!
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
    
    var configOrder: [String] {
        return self._configOrder
    }
}

