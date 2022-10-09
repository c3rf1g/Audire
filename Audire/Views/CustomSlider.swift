//
//  CustomSlider.swift
//  Audire
//
//  Created by Константин Хамицевич on 05.10.2022.
//

import Foundation
import UIKit
import RangeSeekSlider

class CustomSlider: RangeSeekSlider {
    
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let mainColor: UIColor
    let borderShadowColor: UIColor
    
    
    required init(minimumValue: CGFloat, maximumValue: CGFloat, mainColor: UIColor, borderShadowColor: UIColor) {
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.mainColor = mainColor
        self.borderShadowColor = borderShadowColor
    
        super.init(frame: .zero)
        
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    private func setupUI(){
        self.minValue = minimumValue
        self.maxValue = maximumValue
        
        self.lineHeight = 20 * Resources.Multipliers.multiplierY
        self.colorBetweenHandles = mainColor
        self.tintColor = .clear
        
        self.handleDiameter = 20 
        self.handleColor = .clear
       
        self.hideLabels = true
        self.enableStep = true
        self.step = 1
        
        self.layer.borderWidth = 1
        self.layer.borderColor = mainColor.cgColor
        self.layer.cornerRadius = 5
        
        self.layer.shadowColor = borderShadowColor.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        
        if Resources.ScreenSizes.width < 380 {
            self.layer.borderWidth = 0.7
            self.layer.cornerRadius = 3
        }
    }
    
}
