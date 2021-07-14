//
//  ProfilesPresenter.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/12/21.
//

import Foundation
import UIKit

class ProfilesPresenter: NSObject {
    fileprivate var interactor: ProfilesInteractorType
    weak var vc: ProfilesViewController?
    
    fileprivate let profileSectionsDict: [String: ProfileSections] = ["name": .name,
                                                                      "photo":.photo,
                                                                      "gender":.gender([.title, .description]),
                                                                      "about":.about([.title, .description]),
                                                                      "school":.school([.title, .description]),
                                                                      "hobbies":.hobbies([.title, .description])]
    fileprivate var userIndex = 0
    
    init(interactor: ProfilesInteractorType) {
        self.interactor = interactor
    }
    
    fileprivate var user: User  {
        return interactor.usersArray[userIndex]
    }
    fileprivate var profileSections: [ProfileSections] {
        var tempField: [ProfileSections] = []
        for field in interactor.configOrder {
            if user.userAttributes[field] != nil {
                tempField.append(profileSectionsDict[field]!)
            }
        }
        return tempField
    }



    
    func handleViewDidLoad() {
        self.vc?.set(dataSource: self)
        self.vc?.set(delegate: self)
        
        self.vc?.buttonView.addTarget(self, action: #selector(self.handleNextButtonPressed), for: .touchUpInside)
    }
}

extension ProfilesPresenter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.profileSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let profileSection = self.profileSections[section]
        switch profileSection {
        case .name:                return 1
        case .photo:               return 1
        case .gender(let rows):      return rows.count
        case .about(let rows):           return rows.count
        case .school(let rows):                  return rows.count
        case .hobbies(let rows):              return rows.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let profileSection = self.profileSections[indexPath.section]

        switch profileSection {
        case .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.HeaderViewCell.rawValue) as! HeaderViewCell
            cell.selectionStyle = .none
            cell.configure(title: user.userAttributes["name"] as! String)
            return cell
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.ImageViewCell.rawValue) as! ImageViewCell
            cell.selectionStyle = .none
            cell.configure(imageName: String(user.userAttributes["id"] as! Int))
            return cell
            
        case .gender(let row):
            switch row[indexPath.row] {
            case .title:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.HeaderViewCell.rawValue) as! HeaderViewCell
                cell.selectionStyle = .none
                cell.configure(title: "Gender")
                return cell
            case .description:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.TextCell.rawValue) as! TextCell
                cell.selectionStyle = .none
                cell.configure(title: user.userAttributes["gender"] as! String)
                return cell
            }
        case .about(let row):
            switch row[indexPath.row] {
            case .title:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.HeaderViewCell.rawValue) as! HeaderViewCell
                cell.selectionStyle = .none
                cell.configure(title: "About")
                return cell
            case .description:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.TextCell.rawValue) as! TextCell
                cell.selectionStyle = .none
                cell.configure(title: user.userAttributes["about"] as! String)
                return cell
            }
        case .school(let row):
            switch row[indexPath.row] {
            case .title:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.HeaderViewCell.rawValue) as! HeaderViewCell
                cell.selectionStyle = .none
                cell.configure(title: "School")
                return cell
            case .description:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.TextCell.rawValue) as! TextCell
                cell.selectionStyle = .none
                cell.configure(title: user.userAttributes["school"] as! String)
                return cell
            }
        case .hobbies(let row):
            switch row[indexPath.row] {
            case .title:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.HeaderViewCell.rawValue) as! HeaderViewCell
                cell.selectionStyle = .none
                cell.configure(title: "Hobbies")
                return cell
            case .description:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.TextCell.rawValue) as! TextCell
                cell.selectionStyle = .none
                cell.configure(title: ((user.userAttributes["hobbies"] as! [String]).joined(separator: ", ")))
                return cell
            }
        }
    }
}

extension ProfilesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

extension ProfilesPresenter {
    @objc func handleNextButtonPressed() {
        self.userIndex += 1
        if self.userIndex == self.interactor.usersArray.count {
            self.userIndex = 0
            
        }
        self.vc?.tableView.reloadData()
    }

}


public enum ProfileProperties: String {
    case HeaderViewCell
    case ImageViewCell
    case TextCell
}

public enum ProfileSections {
    case name
    case photo
    case gender([TextSections])
    case about([TextSections])
    case school([TextSections])
    case hobbies([TextSections])
}


public enum TextSections {
    case title
    case description
}
