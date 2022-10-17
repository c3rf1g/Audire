import UIKit
import SnapKit

final class NavigationBarView: UIView {
    private let earphonesImage = UIImageView(image: Resources.AppImages.earphones)
    private let chargeStatusImage = UIImageView(image: Resources.AppImages.chargeStatus)
    private let firstTokenImage = UIImageView(image: Resources.AppImages.firstToken)
    private let secondTokenImage = UIImageView(image: Resources.AppImages.secondToken)
    private let firstLabel = CustomLabel(customText: "0.57", fontStyle: "Regular", fontSize: 20)
    private let secondLabel = CustomLabel(customText: "1680.21", fontStyle: "Regular", fontSize: 20)
    
    public let backButton = CustomArrowButton(orientation: .left)
    private let withBackButton: Bool
    
    required init(withBackButton: Bool) {
        self.withBackButton = withBackButton
        
        super.init(frame: .zero)
        
        self.addingSubviews()
        self.setupContentMode()
        self.setupConst()
        
        if self.withBackButton == false {
            backButton.snp.removeConstraints()
            backButton.removeFromSuperview()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addingSubviews() {
        self.addSubview(earphonesImage)
        self.addSubview(chargeStatusImage)
        self.addSubview(firstTokenImage)
        self.addSubview(secondTokenImage)
        self.addSubview(firstLabel)
        self.addSubview(secondLabel)
        self.addSubview(backButton)
    }
    
    private func setupContentMode() {
        earphonesImage.contentMode = .scaleAspectFit
        chargeStatusImage.contentMode = .scaleAspectFit
        firstTokenImage.contentMode = .scaleAspectFit
        secondTokenImage.contentMode = .scaleAspectFit
    }
    
    private func setupConst() {
        
        // MARK: earphonesImage
        earphonesImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(338 * Resources.Multipliers.multiplierX)
            make.top.bottom.equalToSuperview()
        }

        // MARK: chargeStatusImage
        chargeStatusImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(101.5 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(303.5 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(-5 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(-5 * Resources.Multipliers.multiplierY)
        }
        
        // MARK: firstTokenImage
        firstTokenImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(369 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(24 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(-5 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(40 * Resources.Multipliers.multiplierY)
        }
        
        // MARK: secondTokenImage
        secondTokenImage.snp.makeConstraints { make in
            make.centerX.equalTo(firstTokenImage.snp.centerX)
            make.trailing.equalToSuperview().inset(22.5 * Resources.Multipliers.multiplierX)
            make.top.equalTo(firstTokenImage.snp.bottom).offset(2 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(-10.5 * Resources.Multipliers.multiplierY)
        }
        
        // MARK: firstLabel
        firstLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(317 * Resources.Multipliers.multiplierX).priority(.medium)
            make.trailing.equalToSuperview().inset(70 * Resources.Multipliers.multiplierX).priority(.high)
            make.centerY.equalTo(firstTokenImage.snp.centerY)
        }
        
        // MARK: secondLabel
        secondLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(291 * Resources.Multipliers.multiplierX).priority(.medium)
            make.trailing.equalToSuperview().inset(70 * Resources.Multipliers.multiplierX).priority(.high)
            make.centerY.equalTo(secondTokenImage.snp.centerY)
        }
        
        // MARK: backButton
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(7)
            make.height.equalTo(16)
            make.leading.equalToSuperview().inset(10 * Resources.Multipliers.multiplierX)
        }
    }
}
