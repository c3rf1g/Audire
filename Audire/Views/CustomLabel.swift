//
//  CustomLabel.swift
//  Audire
//
//  Created by Константин Хамицевич on 05.10.2022.
//

import Foundation
import UIKit
import SnapKit

class CustomLabel: UILabel {
    
    private let customText: String
    private let fontStyle: String
    private let fontSize: CGFloat
    
    required init(customText: String, fontStyle: String, fontSize: CGFloat) {
        self.customText = customText
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        
        super.init(frame: .zero)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        text = customText
        
        if Resources.ScreenSizes.width < 380 {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
        } else {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        textColor = .white
    }
}
