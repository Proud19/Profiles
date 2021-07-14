//
//  ButtonView.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/13/21.
//

import UIKit

class RoundedtButtonView: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
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
    
    func configure(percentageDiameter: Int) {
        let diameter =  CGFloat(percentageDiameter)/100 * UIScreen.main.bounds.width
        self.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func configure(percentagePosX: Int, percentagePosY: Int) {
        let x =  CGFloat(percentagePosX)/100 * UIScreen.main.bounds.width
        let y =  CGFloat(percentagePosY)/100 * UIScreen.main.bounds.height
        self.center.x = x
        self.center.y = y
    }
}
