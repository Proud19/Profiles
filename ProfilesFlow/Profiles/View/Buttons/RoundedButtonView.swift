//
//  ButtonView.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/13/21.
//

import UIKit

class RoundedtButtonView: UIButton {
    
    init() {
        super.init(frame: .zero)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }

    func commonInit() {
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6.0
    }
    
}

extension RoundedtButtonView {
    func configure(title: String) {
        self.setTitle(title, for: .normal)
    }
}
