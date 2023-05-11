//
//  LogoTitle.swift
//  HabitsTracker
//
//  Created by Adilet on 10/5/23.
//

import UIKit

class TitleLogo: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.text = "HabiTapp"

        self.textColor = .white
        self.font = UIFont(name: "Comfortaa-Bold", size: 54)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
