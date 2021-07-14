//
//  ImageViewCell.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/12/21.
//

import UIKit

class ImageViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension ImageViewCell {
    func configure(imageName: String?) {
        
        // more dynamic cgRect values to be added
        let imageWidth = UIScreen.main.bounds.width/2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth * 1.3))
        imageView.center.x =  UIScreen.main.bounds.width/2
        imageView.image = UIImage(named: imageName!)
        self.contentView.addSubview(imageView)
        
        let views = ["imageView" : imageView]
        let imageViewConstraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: views)
        let imageViewConstraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[imageView]-10-|", options: [], metrics: nil, views: views)
        

        // add constraints
        self.contentView.addConstraints(imageViewConstraintsH + imageViewConstraintsV)
    }
}
