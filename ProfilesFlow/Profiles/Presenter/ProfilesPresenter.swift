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
    
    init(interactor: ProfilesInteractorType) {
        self.interactor = interactor
    }
    
    func handleViewDidLoad() {
        self.vc?.set(dataSource: self)
        self.vc?.set(delegate: self)
        print("Presenter handling viewDidLoad...")
    }
}

extension ProfilesPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.interactor.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.HeaderViewCell.rawValue) as! HeaderViewCell
        cell.configure(name: "Test name")
        return cell
    }
}

extension ProfilesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

public enum cellIdentifiers: String {
    case HeaderViewCell
    case ImageViewCell
    case TextCell
}
