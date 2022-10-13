import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    private struct Constants {
        static let profileAvatarBorderWidth: CGFloat = 1.5
        static let profileAvatarCornerRadius: CGFloat = (181 / 2) * Resources.Multipliers.multiplierY
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
    
    private let button = CustomIconButton(
        iconImage: Resources.AppImages.wallet!,
        iconButtonLabel: CustomLabel(customText: "Wallet", fontStyle: "Regular", fontSize: 20),
        radius: 10
    )
    
    private let button1 = CustomIconButton(
        iconImage: Resources.AppImages.account!,
        iconButtonLabel: CustomLabel(customText: "Account", fontStyle: "Regular", fontSize: 20),
        radius: 10
    )
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = Resources.Colors.backgroundColor

        
        //self.addSubview(profileAvatar)
        self.addSubview(button)
        self.addSubview(button1)

        
        /*
        profileAvatar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(181)
            make.height.equalTo(181)
        }
        */
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(471 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(414 * Resources.Multipliers.multiplierY)
            make.right.equalToSuperview().inset(123 * Resources.Multipliers.multiplierX)
            make.left.equalToSuperview().inset(123 * Resources.Multipliers.multiplierX)
            
        }
        
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(600 * Resources.Multipliers.multiplierY)
            make.width.equalTo(182 * Resources.Multipliers.multiplierX)
            make.height.equalTo(41 * Resources.Multipliers.multiplierY)
        }
       
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
