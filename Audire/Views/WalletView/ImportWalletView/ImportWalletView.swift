import UIKit
import SnapKit

final class ImportWalletView: UIView {
    
    private let importWalletLabel = CustomLabel(
        customText: "Import a wallet",
        fontStyle: "Bold",
        fontSize: 24
    )
    
    private let walletNameLabel = CustomLabel(
        customText: "Wallet name",
        fontStyle: "Light",
        fontSize: 24
    )
    
    private let enterWalletNameTextField = CustomTextField(
        startText: "Name",
        fontStyle: "Light",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .defaultType,
        withDoneButton: false
    )
    
    private let secretPhraseLabel = CustomLabel(
        customText: "Secret phrase",
        fontStyle: "Light",
        fontSize: 24
    )
    
    private let notificationLabel = CustomLabel(
        customText: "Please write down a secret phrase. It is used to open the wallet on another device.",
        fontStyle: "Regular",
        fontSize: 16
    )
    
    let importWalletButton = CustomButton(
        text: "Import a wallet",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    
    let closeButton = CustomSymbolButton(
        orientation: .standart,
        symbolImage: Resources.AppImages.crossButtonImage
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
        enterWalletNameTextField.addLeftSpacing(width: 10, height: enterWalletNameTextField.frame.height)
        enterWalletNameTextField.addRightSpacing(width: 10, height: enterWalletNameTextField.frame.height)
        
        notificationLabel.numberOfLines = 2
        notificationLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        notificationLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func addingSubviews() {
        let elementsArray = [
            importWalletLabel, walletNameLabel,
            enterWalletNameTextField, secretPhraseLabel,
            notificationLabel, importWalletButton, closeButton
        ]
        
        for element in elementsArray {
            self.addSubview(element)
        }
    }
    
    private func setupTargetsAndDelegates() {
        enterWalletNameTextField.delegate = self
    }
    
    func setupSelfConst(multiplierX: Double, multiplierY: Double) {
        importWalletLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(254 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(83 * multiplierY)
            make.bottom.equalToSuperview().inset(757 * multiplierY)
        }
        
        walletNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(30 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(142 * multiplierY)
            make.bottom.equalToSuperview().inset(698 * multiplierY)
        }
        
        enterWalletNameTextField.snp.makeConstraints { make in
            make.top.equalTo(walletNameLabel.snp.bottom).offset(35 * multiplierY)
            make.height.equalTo(41 * multiplierY)
            make.leading.trailing.equalToSuperview().inset(30 * multiplierX)
        }
        
        secretPhraseLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * multiplierX)
            make.top.equalTo(enterWalletNameTextField.snp.bottom).offset(41 * multiplierY)
        }
        
        notificationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * multiplierX)
            make.top.equalTo(secretPhraseLabel.snp.bottom).offset(12 * multiplierY)
        }
        
        importWalletButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * multiplierX)
            make.top.equalTo(walletNameLabel.snp.bottom).offset(538.67 * multiplierY)
            make.height.equalTo(41 * multiplierY)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20 * multiplierX)
            make.trailing.equalToSuperview().inset(392 * multiplierX).priority(750)
            make.top.equalToSuperview().inset(20 * multiplierY)
            make.bottom.equalToSuperview().inset(833 * multiplierY)
            make.width.equalTo(closeButton.snp.height).priority(1000)
        }
    }
}

extension ImportWalletView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == enterWalletNameTextField {
            if textField.text != "" {
                walletNameLabel.text = textField.text
            }
            if textField.text == "" {
                walletNameLabel.text = "Wallet name"
            }
        }
    }
}
