import Foundation
import UIKit
import SnapKit

final class ProfileView: UIView {
    private struct Constants {
        static let profileAvatarBorderWidth: CGFloat = 1.5
        static let profileAvatarCornerRadius: CGFloat = (182 / 2) * Resources.Multipliers.multiplierX
    }
    
    private let profileAvatar: UIImageView = {
        let avatar = UIImageView(image: Resources.AppImages.earphones)
        avatar.backgroundColor = .systemGray
        avatar.layer.cornerRadius = Constants.profileAvatarCornerRadius
        avatar.clipsToBounds = true
        
        avatar.layer.borderColor = Resources.Colors.profileAtarBorderColor.cgColor
        avatar.layer.borderWidth = Constants.profileAvatarBorderWidth
        return avatar
    }()
    
    private let walletAdress = CustomLabel(
        customText: "0x4675C7e5BaAFBFFbca748158bEcBA61ef3b0a263",
        fontStyle: "Light",
        fontSize: 20
    )
    
    let walletButton = CustomIconButton(
        iconImage: Resources.AppImages.wallet!,
        iconButtonLabel: CustomLabel(customText: "Wallet", fontStyle: "Regular", fontSize: 20),
        radius: 10
    )
    let accountButton = CustomIconButton(
        iconImage: Resources.AppImages.account!,
        iconButtonLabel: CustomLabel(customText: "Account", fontStyle: "Regular", fontSize: 20),
        radius: 10
    )
    let settingsButton = CustomIconButton(
        iconImage: Resources.AppImages.settings!,
        iconButtonLabel: CustomLabel(customText: "Settings", fontStyle: "Regular", fontSize: 20),
        radius: 10
    )
    let aboutButton = CustomIconButton(
        iconImage: Resources.AppImages.about!,
        iconButtonLabel: CustomLabel(customText: "About", fontStyle: "Regular", fontSize: 20),
        radius: 10
    )
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setupUI()
        self.addingSubviews()
        self.setupConst()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        self.walletAdress.textColor = Resources.Colors.activeButtonTextColor
        self.walletAdress.textAlignment = .center
        self.walletAdress.lineBreakMode = .byTruncatingMiddle
    }
    
    private func addingSubviews() {
        let elementsArray = [
            profileAvatar, walletButton,
            accountButton, settingsButton,
            aboutButton, walletAdress
        ]
        
        for element in elementsArray {
            self.addSubview(element)
        }
    }
    
    private func setupConst() {
        profileAvatar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(143 * Resources.Multipliers.multiplierY).priority(750)
            make.bottom.equalToSuperview().inset(601 * Resources.Multipliers.multiplierY)
            make.leading.trailing.equalToSuperview().inset(123 * Resources.Multipliers.multiplierX)
            make.width.equalTo(profileAvatar.snp.height).priority(1000)
        }
        
        walletButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(471 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(413 * Resources.Multipliers.multiplierY)
            make.centerX.equalToSuperview()
        }
        
        accountButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(553 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(331 * Resources.Multipliers.multiplierY)
            make.centerX.equalToSuperview()
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(635 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(249 * Resources.Multipliers.multiplierY)
            make.centerX.equalToSuperview()
        }
        
        aboutButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(717 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(167 * Resources.Multipliers.multiplierY)
            make.centerX.equalToSuperview()
        }
        
        walletAdress.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(365 * Resources.Multipliers.multiplierY)
            make.leading.trailing.equalToSuperview().inset(123 * Resources.Multipliers.multiplierX)
        }
    }
}
