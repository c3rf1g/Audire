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
    
    var text: String
    var fontStyle: String
    var fontSize: CGFloat

    required init(text: String, fontStyle: String, fontSize: CGFloat) {
       
        self.text = text
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        
        super.init(frame: .zero)
        
        self.customView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customView() {
        
        let screen = UIScreen.main.bounds
        let multiplierY = Double(screen.size.height / 926)
       
        backgroundColor = UIColor(red: 39/255, green: 0/255, blue: 74/255, alpha: 1)
        
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor(red: 139/255, green: 117/255, blue: 156/255, alpha: 1), for: .highlighted)
        
        if screen.size.width < 380 {
            titleLabel?.font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
        } else {
            titleLabel?.font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        layer.cornerRadius =  ((30 - 10) / 2 ) * multiplierY
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        
        addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        addTarget(self, action: #selector(clicked), for: .touchDown)
        
    }
    
    @objc private func unclicked() {
        self.backgroundColor = UIColor(red: 39/255, green: 0/255, blue: 74/255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
    }
    
    @objc private func clicked() {
        backgroundColor = UIColor(red: 48/255, green: 35/255, blue: 61/255, alpha: 1)
        layer.shadowOffset = CGSize(width: -4, height: -4)
    }
    
}
