import UIKit

final class CustomTextField: UITextField {
    private struct Constants {
        static let screenWidthForChangingFontSize: CGFloat = 380
        static let borderWidth: CGFloat = 2
    }
    
    private let startText: String
    private let fontStyle: String
    private let fontSize: CGFloat
    private let cornerRadius: CGFloat
    enum KeyboardType {
        case numbersOnly
        case numbersWithPoint
        case defaultType
    }
    private let keyboard: KeyboardType
    private let withDoneButton: Bool
    
    required init(startText: String, fontStyle: String, fontSize: CGFloat, cornerRadius: CGFloat, keyboard: KeyboardType, withDoneButton: Bool) {
        self.startText = startText
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        self.cornerRadius = cornerRadius
        self.keyboard = keyboard
        self.withDoneButton = withDoneButton
        
        super.init(frame: .zero)
        
        setupUI()
        
        if self.withDoneButton == true {
            addDoneButtonOnKeyboard()
        }
        
        setupTargets()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Resources.Colors.activeButtonTextColor.cgColor
        layer.cornerRadius = self.cornerRadius
        
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .right
        
        attributedPlaceholder = NSAttributedString(
            string: startText,
            attributes: [NSAttributedString.Key.foregroundColor: Resources.Colors.activeButtonTextColor]
        )
        
        textColor = .white
        textAlignment = .center
        
        if Resources.ScreenSizes.width < Constants.screenWidthForChangingFontSize {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
            layer.borderWidth = Constants.borderWidth - 0.7
            layer.cornerRadius = self.cornerRadius - 2
        } else {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        switch keyboard {
        case .numbersOnly:
            keyboardType = .numberPad
        case .numbersWithPoint:
            keyboardType = .decimalPad
        case .defaultType:
            keyboardType = .default
        }

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
    
    private func setupTargets() {
        if self.keyboard != .defaultType {
            self.addTargetForReplacingArabianNumbers()
        }
        self.addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
        
    @objc private func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    @objc private func didBeginEditing() {
        layer.borderColor = UIColor.white.cgColor
    }
    
    @objc private func didEndEditing() {
        if self.text == "" {
            layer.borderColor = Resources.Colors.activeButtonTextColor.cgColor
        }
    }
}
