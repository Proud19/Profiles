//
//  HeaderViewTableViewCell.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/12/21.
//

import UIKit

class HeaderViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
     
       

    }
}

extension HeaderViewCell {
    func configure(name: String) {
        self.textLabel?.text = name
    }
}
