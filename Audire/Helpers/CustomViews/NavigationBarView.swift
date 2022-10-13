import UIKit
import SnapKit

final class NavigationBarView: UIView {
    private let earphonesImage = UIImageView(image: Resources.AppImages.earphones)
    private let chargeStatusImage = UIImageView(image: Resources.AppImages.chargeStatus)
    private let firstTokenImage = UIImageView(image: Resources.AppImages.firstToken)
    private let secondTokenImage = UIImageView(image: Resources.AppImages.secondToken)
    private let firstLabel = CustomLabel(customText: "0.57", fontStyle: "Regular", fontSize: 20)
    private let secondLabel = CustomLabel(customText: "1680.21", fontStyle: "Regular", fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addingSubviews()
        self.setupContentMode()
        self.setupConst()
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
    }
    
    private func setupContentMode() {
        earphonesImage.contentMode = .scaleAspectFit
        chargeStatusImage.contentMode = .scaleAspectFit
        firstTokenImage.contentMode = .scaleAspectFit
        secondTokenImage.contentMode = .scaleAspectFit
    }
    
    private func setupConst() {
        
        //MARK: earphonesImage
        earphonesImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.right.equalToSuperview().inset(338 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(0 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(61 * Resources.Multipliers.multiplierY)
        }
        
        //MARK: chargeStatusImage
        chargeStatusImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(101.5 * Resources.Multipliers.multiplierX)
            make.right.equalToSuperview().inset(303.5 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(-5 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(55 * Resources.Multipliers.multiplierY)
        }
        
        //MARK: firstTokenImage
        firstTokenImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(369 * Resources.Multipliers.multiplierX)
            make.right.equalToSuperview().inset(24 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(-5 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(91 * Resources.Multipliers.multiplierY)
        }
        
        //MARK: secondTokenImage
        secondTokenImage.snp.makeConstraints { make in
            make.centerX.equalTo(firstTokenImage.snp.centerX)
            make.right.equalToSuperview().inset(22.5 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(26 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(55.5 * Resources.Multipliers.multiplierY)
        }
        
        //MARK: firstLabel
        firstLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(317 * Resources.Multipliers.multiplierX).priority(.medium)
            make.right.equalToSuperview().inset(70 * Resources.Multipliers.multiplierY).priority(.high)
            make.top.equalToSuperview().inset(6 * Resources.Multipliers.multiplierY).priority(.medium)
            make.centerY.equalTo(secondTokenImage.snp.centerY)
        }
        
        //MARK: secondLabel
        secondLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(291 * Resources.Multipliers.multiplierX).priority(.medium)
            make.right.equalToSuperview().inset(70 * Resources.Multipliers.multiplierY).priority(.high)
            make.top.equalToSuperview().inset(44.5 * Resources.Multipliers.multiplierY).priority(.medium)
            make.centerY.equalTo(firstTokenImage.snp.centerY)
        }
    }
}
