import UIKit
import SnapKit

final class CustomIconButton: UIButton {
    private struct Constants {
        static let screenWidthForChangingFontSize: CGFloat = 380
        static let shadowOffsetWidth: CGFloat = 4
        static let shadowOffsetHeight: CGFloat = 4
        static let shadowOpacity: Float = 0.25
        static let shadowRadius: CGFloat = 5
    }
    
    private let iconImage: UIImage
    private let iconImageView: UIImageView
    private let iconButtonLabel: CustomLabel
    private let radius: CGFloat

    required init(iconImage: UIImage, iconButtonLabel: CustomLabel, radius: CGFloat) {
        self.iconImage = iconImage.withRenderingMode(.alwaysTemplate)
        self.iconImageView = UIImageView(image: self.iconImage)
        self.iconButtonLabel = iconButtonLabel
        self.radius = radius
        super.init(frame: .zero)
        
        self.setupUI()
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.iconImageView.tintColor = .white
        self.backgroundColor = Resources.Colors.inactiveButtonColor
        self.layer.cornerRadius = radius * Resources.Multipliers.multiplierY
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: Constants.shadowOffsetWidth, height: Constants.shadowOffsetHeight)
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowRadius = Constants.shadowRadius
    }
    
    private func addingSubviews() {
        self.addSubview(iconImageView)
        self.addSubview(iconButtonLabel)
    }
    
    private func setupConst() {
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(136 * Resources.Multipliers.multiplierX).priority(750)
            make.top.equalToSuperview().inset(4 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(6 * Resources.Multipliers.multiplierY)
            make.width.equalTo(iconImageView.snp.height).priority(1000) 
        }
        
        iconButtonLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(16 * Resources.Multipliers.multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(56 * Resources.Multipliers.multiplierX).priority(.low)
            make.top.equalToSuperview().inset(9 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(10 * Resources.Multipliers.multiplierY)
        }
    }
    
    private func addingTargets() {
        self.addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
        self.addTarget(self, action: #selector(unclicked), for: .touchDragExit)
    }
    
    @objc private func unclicked() {
        self.backgroundColor = Resources.Colors.inactiveButtonColor
        self.layer.shadowOffset = CGSize(width: Constants.shadowOffsetWidth, height: Constants.shadowOffsetHeight)
        self.iconButtonLabel.textColor = .white
        self.iconImageView.tintColor = .white
    }
    
    @objc private func clicked() {
        self.backgroundColor = Resources.Colors.activeButtonColor
        self.layer.shadowOffset = CGSize(width: -Constants.shadowOffsetWidth, height: -Constants.shadowOffsetHeight)
        self.iconButtonLabel.textColor = Resources.Colors.activeButtonTextColor
        self.iconImageView.tintColor = Resources.Colors.activeButtonTextColor
    }
}
