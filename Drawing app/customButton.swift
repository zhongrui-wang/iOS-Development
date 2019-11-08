//
//  customButton.swift
//  lab3
//
//  Created by RUI WANG on 10/1/19.
//  Copyright © 2019 RUI WANG. All rights reserved.
//

import UIKit

class customButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.widthAnchor.constraint(equalToConstant: 35.0).isActive = true
        self.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        self.layer.cornerRadius = 17.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
