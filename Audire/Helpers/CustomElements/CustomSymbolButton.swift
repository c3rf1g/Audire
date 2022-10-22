import UIKit
import SnapKit

final class CustomSymbolButton: UIButton {
    enum Orientation {
        case left
        case right
        case standart
    }
    
    private var symbolImage: UIImage?
    private var symbolImageView = UIImageView(frame: .zero)
    private let orientation: Orientation
    
    required init(orientation: Orientation, symbolImage: UIImage?) {
        self.orientation = orientation
        self.symbolImage = symbolImage?.withRenderingMode(.alwaysTemplate)
        super.init(frame: .zero)
        
        self.setupUI()
        self.addSubview(symbolImageView)
        symbolImageView.snp.makeConstraints { make in
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
        case .left, .standart:
            break
        case .right:
            symbolImage = symbolImage?.withHorizontallyFlippedOrientation()
        }
        symbolImageView = UIImageView(image: self.symbolImage)
        symbolImageView.tintColor = .white
    }
    
    private func addingTargets() {
        self.addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
    }
    
    @objc private func unclicked() {
        self.symbolImageView.tintColor = .white
    }
    
    @objc private func clicked() {
        self.symbolImageView.tintColor = Resources.Colors.activeButtonTextColor
    }
}
