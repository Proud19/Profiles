//
//  ProfilesWireframe.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/8/21.
//

import UIKit

class ProfilesWireframe {
    func present() -> UINavigationController {
        let _ = ProfilesInteractor()
//        let presenter = CountryCodePresenter(interactor: interactor)
//        let vc = CountryCodeViewController(presenter: presenter)
        let nav = UINavigationController()
//        presenter.vc = vc
        return nav
    }
}
