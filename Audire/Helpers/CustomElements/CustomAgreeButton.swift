import UIKit
import SnapKit

final class CustomAgreeButton: UIButton {
    
    private let rectangleImage = Resources.AppImages.rectangleButtonImage
    private let checkImage = Resources.AppImages.checkButtonImage
    private var rectangleImageView = UIImageView(frame: .zero)
    private var checkImageView = UIImageView(frame: .zero)
    private var counter = 0
    
    required init() {
        super.init(frame: .zero)
        
        self.setupUI()
        self.addSubview(rectangleImageView)
        rectangleImageView.snp.makeConstraints { make in
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
        rectangleImageView = UIImageView(image: self.rectangleImage)
        rectangleImageView.tintColor = .white
        checkImageView = UIImageView(image: self.checkImage)
        checkImageView.tintColor = .white
    }
    
    private func addingTargets() {
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
    }
    
    @objc private func clicked() {
        if counter % 2 == 0 {
            self.addSubview(checkImageView)
            checkImageView.snp.makeConstraints { make in
                make.width.height.equalToSuperview()
                make.center.equalToSuperview()
            }
        } else {
            self.checkImageView.removeFromSuperview()
        }
        counter += 1
    }
}
