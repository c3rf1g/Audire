import UIKit
import SnapKit

final class EnterSecretPhraseView: UIView {
    private let newWalletLabel = CustomLabel(
        customText: "New wallet",
        fontStyle: "Bold",
        fontSize: 24
    )
    
    private let secretPhraseLabel = CustomLabel(
        customText: "Secret phrase",
        fontStyle: "Light",
        fontSize: 24
    )
    
    private let notificationLabel = CustomLabel(
        customText: "Please select the words below in order they are used in the secret phrase",
        fontStyle: "Regular",
        fontSize: 16
    )
    
    let confirmButton = CustomButton(
        text: "Confirm",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    
    let backButton = CustomSymbolButton(
        orientation: .left,
        symbolImage: Resources.AppImages.arrowButtonImage
    )
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setupUI()
        self.addingSubviews()
        self.setupTargetsAndDelegates()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        notificationLabel.numberOfLines = 2
        notificationLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        notificationLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func addingSubviews() {
        let elementsArray = [
            newWalletLabel, secretPhraseLabel, notificationLabel,
            confirmButton, backButton
        ]
        
        for element in elementsArray {
            self.addSubview(element)
        }
    }
    
    private func setupTargetsAndDelegates() {
       
    }
    
    func setupSelfConst(multiplierX: Double, multiplierY: Double) {
        newWalletLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(254 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(83 * multiplierY)
            make.bottom.equalToSuperview().inset(757 * multiplierY)
        }
        
        secretPhraseLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(30 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(142 * multiplierY)
            make.bottom.equalToSuperview().inset(698 * multiplierY)
        }
        
        notificationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * multiplierX)
            make.top.equalTo(secretPhraseLabel.snp.bottom).offset(20 * multiplierY)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * multiplierX)
            make.top.equalTo(secretPhraseLabel.snp.bottom).offset(538.67 * multiplierY)
            make.height.equalTo(41 * multiplierY)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20 * multiplierY)
            make.width.equalTo(7)
            make.height.equalTo(16)
            make.leading.equalToSuperview().inset(15 * multiplierX)
        }
    }
}
