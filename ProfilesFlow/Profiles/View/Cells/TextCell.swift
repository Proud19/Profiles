//
//  TextCell.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/12/21.
//

import UIKit

class TextCell: UITableViewCell {
    var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        //configure title Label
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textColor = .black
        self.titleLabel.textAlignment = .left
        
        //add subviews
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.titleLabel)
        
        //create constraints
        let views = ["title" : self.titleLabel]
        let titleConstraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[title]-16-|", options: [], metrics: nil, views: views)
        let titleConstraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[title]-16-|", options: [], metrics: nil, views: views)
        
        //add constraints
        self.contentView.addConstraints(titleConstraintsH + titleConstraintsV)
    }
}

extension TextCell {
    func configure(title: String) {
        self.titleLabel.text = title
    }
}
