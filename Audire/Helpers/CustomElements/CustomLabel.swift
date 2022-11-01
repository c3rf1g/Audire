import UIKit

final class CustomLabel: UILabel {
    private struct Constants {
        static let screenWidthForChangingFontSize: CGFloat = 380
    }
    
    private let customText: String
    private let fontStyle: String
    let fontSize: CGFloat
    
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

        if Resources.ScreenSizes.width < Constants.screenWidthForChangingFontSize {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
        } else {
            font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        textColor = .white
    }
}
