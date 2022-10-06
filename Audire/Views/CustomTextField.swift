//
//  CustomTextField.swift
//  Audire
//
//  Created by Константин Хамицевич on 05.10.2022.
//

import Foundation
import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    private let startText: String
    private let fontStyle: String
    private let fontSize: CGFloat
    
    required init(startText: String, fontStyle: String, fontSize: CGFloat) {
        
        self.startText = startText
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        
        super.init(frame: .zero)
        
        setupUI()
        addDoneButtonOnKeyboard()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.borderWidth = 2
        layer.borderColor = Resources.Colors.activeButtonTextColor.cgColor
        layer.cornerRadius = 5
        
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .right
        
        attributedPlaceholder = NSAttributedString(
            string: startText,
            attributes: [NSAttributedString.Key.foregroundColor: Resources.Colors.activeButtonTextColor]
        )
        
        textColor = Resources.Colors.activeButtonTextColor
        textAlignment = .center
        
        if Resources.ScreenSizes.width < 380 {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
            layer.borderWidth = 1.3
            layer.cornerRadius = 3
        } else {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        keyboardType = .asciiCapableNumberPad
        keyboardAppearance = .dark
        
    }
    
    private func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 428, height: 50))
        doneToolbar.barStyle = .default
           
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let done = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonAction)
        )
            
        let items: NSMutableArray = [flexSpace, done]
          
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }
        
    @objc private func doneButtonAction() {
        self.resignFirstResponder()
    }
}

