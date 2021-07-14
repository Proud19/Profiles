//
//  HeaderViewTableViewCell.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/12/21.
//

import UIKit

class HeaderViewCell: TextCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func commonInit() {
        super.commonInit()
        self.titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
    }
}
