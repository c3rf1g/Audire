import UIKit
import SnapKit

final class CustomArrowButton: UIButton {
    enum Orientation {
        case left
        case right
    }
    
    private var iconImage = Resources.AppImages.arrowButtonImage?.withRenderingMode(.alwaysTemplate)
    private var iconImageView = UIImageView(frame: .zero)
    private let orientation: Orientation
    
    required init(orientation: Orientation) {
        self.orientation = orientation
        super.init(frame: .zero)
        
        self.setupUI()
        self.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        self.addingTargets()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        switch orientation {
        case .left:
            break
        case .right:
            iconImage = iconImage?.withHorizontallyFlippedOrientation()
        }
        iconImageView = UIImageView(image: self.iconImage)
        iconImageView.tintColor = .white
    }
    
    private func addingTargets() {
        self.addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
    }
    
    @objc private func unclicked() {
        self.iconImageView.tintColor = .white
    }
    
    @objc private func clicked() {
        self.iconImageView.tintColor = Resources.Colors.activeButtonTextColor
    }
}
