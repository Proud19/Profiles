//
//  ProfilesWireframe.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/8/21.
//

import UIKit

class ProfilesWireframe {
    func present() -> UIViewController {
        let interactor = ProfilesInteractor()
        let presenter = ProfilesPresenter(interactor: interactor)
        let vc = ProfilesViewController(presenter: presenter)
        presenter.vc = vc
        return vc
    }
}
