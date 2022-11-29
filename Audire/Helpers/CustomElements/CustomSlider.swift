import UIKit

final class CustomSlider: RangeSeekSlider {
    private struct Constants {
        static let lineHeight: Double = 20
        static let handleDiametr: Double = 20
        static let step: CGFloat = 1
        static let screenWidthForChangingCornerRadius: CGFloat = 380
        static let shadowOpacity: Float = 1
        static let shadowRadius: CGFloat = 5
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 5
    }
    
    private let minimumValue: CGFloat
    private let maximumValue: CGFloat
    private let mainColor: UIColor
    private let borderShadowColor: UIColor
    
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
    
    private func setupUI() {
        self.minValue = minimumValue
        self.maxValue = maximumValue
        
        self.lineHeight = Constants.lineHeight * Resources.Multipliers.multiplierY
        self.colorBetweenHandles = mainColor
        self.tintColor = .clear
        
        self.handleDiameter = Constants.handleDiametr
        self.handleColor = .clear
       
        self.hideLabels = true
        self.enableStep = true
        self.step = Constants.step
        
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = mainColor.cgColor
        self.layer.cornerRadius = Constants.cornerRadius
        
        self.layer.shadowColor = borderShadowColor.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowRadius = Constants.shadowRadius
        
        if Resources.ScreenSizes.width < Constants.screenWidthForChangingCornerRadius {
            self.layer.borderWidth = Constants.borderWidth - 0.3
            self.layer.cornerRadius = Constants.cornerRadius - 2
        }
    }
}
