//
//  ButtonRounded.swift
//  calculatorwithui
//
//  Created by Andrey Krit on 09.05.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class ButtonRounded: UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
