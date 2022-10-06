//
//  CustomSlider.swift
//  Audire
//
//  Created by Константин Хамицевич on 05.10.2022.
//

import Foundation
import UIKit

class CustomSlider: UISlider {
    
    private let minValue: Float
    private let maxValue: Float
    private let color: UIColor
    
    required init(minValue: Float, maxValue: Float, color: UIColor) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.color = color
        
        super.init(frame: .zero)
        
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.maximumValue = maxValue
        self.minimumValue = minValue
        self.value = 100
        self.thumbTintColor = color
        self.minimumTrackTintColor = color
    }
    
}
