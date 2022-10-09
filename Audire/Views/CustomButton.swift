//
//  ButtonView.swift
//  marketplaceSorting
//
//  Created by Константин Хамицевич on 02.10.2022.
//

import Foundation
import UIKit
import SnapKit

class CustomButton: UIButton {
    
    private let text: String
    private let fontStyle: String
    private let fontSize: CGFloat
    private let radius: CGFloat

    required init(text: String, fontStyle: String, fontSize: CGFloat, radius: CGFloat) {
        self.text = text
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        self.radius = radius
        
        super.init(frame: .zero)
        
        self.setupUI()
        self.addingTargets()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = Resources.Colors.inactiveButtonColor
        
        //MARK: Text
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(Resources.Colors.activeButtonTextColor, for: .highlighted)
        
        if Resources.ScreenSizes.width < 380 {
            self.titleLabel?.font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
        } else {
            self.titleLabel?.font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        //MARK: Cornerns and Shadow
        //self.layer.cornerRadius =  ((30 - 10) / 2 ) * Resources.Multipliers.multiplierY
        self.layer.cornerRadius = radius * Resources.Multipliers.multiplierY
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 5
    }
    
    private func addingTargets() {
        self.addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
    }
    
    @objc private func unclicked() {
        self.backgroundColor = Resources.Colors.inactiveButtonColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
    }
    
    @objc private func clicked() {
        self.backgroundColor = Resources.Colors.activeButtonColor
        self.layer.shadowOffset = CGSize(width: -4, height: -4)
    }
}


    


