import UIKit
import SnapKit

final class CustomButton: UIButton {
    private struct Constants {
        static let screenWidthForChangingFontSize: CGFloat = 380
        static let shadowOffsetWidth: CGFloat = 4
        static let shadowOffsetHeight: CGFloat = 4
        static let shadowOpacity: Float = 0.25
        static let shadowRadius: CGFloat = 5
    }
    
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
        
        // MARK: Text
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(Resources.Colors.activeButtonTextColor, for: .highlighted)
        
        if Resources.ScreenSizes.width < Constants.screenWidthForChangingFontSize {
            self.titleLabel?.font = UIFont(name: "Montserrat-\(fontStyle)", size: (fontSize - 4))
        } else {
            self.titleLabel?.font = UIFont(name: "Montserrat-\(fontStyle)", size: fontSize)
        }
        
        // MARK: Cornerns and Shadow
        self.layer.cornerRadius = radius * Resources.Multipliers.multiplierX
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: Constants.shadowOffsetWidth, height: Constants.shadowOffsetHeight)
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowRadius = Constants.shadowRadius
    }
    
    private func addingTargets() {
        self.addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
        self.addTarget(self, action: #selector(unclicked), for: .touchDragExit)
    }
    
    @objc private func unclicked() {
        self.backgroundColor = Resources.Colors.inactiveButtonColor
        self.layer.shadowOffset = CGSize(
            width: Constants.shadowOffsetWidth,
            height: Constants.shadowOffsetHeight
        )
    }
    
    @objc private func clicked() {
        self.backgroundColor = Resources.Colors.activeButtonColor
        self.layer.shadowOffset = CGSize(
            width: -Constants.shadowOffsetWidth,
            height: -Constants.shadowOffsetHeight
        )
    }
    
    func setAlwaysPressed() {
        self.removeTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.removeTarget(self, action: #selector(clicked), for: .touchDown)
        self.removeTarget(self, action: #selector(unclicked), for: .touchDragExit)
        
        self.setTitleColor(Resources.Colors.activeButtonTextColor, for: .normal)
        self.backgroundColor = Resources.Colors.activeButtonColor
        self.layer.shadowOffset = CGSize(
            width: -Constants.shadowOffsetWidth,
            height: -Constants.shadowOffsetHeight
        )
    }
}
