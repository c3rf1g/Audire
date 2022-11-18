import UIKit
import SnapKit

final class SignUpView: UIView {
    
    private let audireLabel = CustomLabel(
        customText: "AUDIRE",
        fontStyle: "Bold",
        fontSize: 36
    )
    
    let loginButton = CustomButton(
        text: "Login",
        fontStyle: "Regular",
        fontSize: 23,
        radius: 10
    )
    
    private let signUpButton = CustomButton(
        text: "Sign up",
        fontStyle: "Regular",
        fontSize: 23,
        radius: 10
    )
    
    private let emailTextField = CustomTextField(
        startText: "Email adress",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .email,
        withDoneButton: false
    )
    
    private let passwordTextField = CustomTextField(
        startText: "Password",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .defaultType,
        withDoneButton: false
    )
    
    private let repeatPasswordTextField = CustomTextField(
        startText: "Repeat password",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .defaultType,
        withDoneButton: false
    )
    
    let largeSignUpButton = CustomButton(
        text: "Sign up",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    
    let agreeButton = CustomAgreeButton()
    
    private var agreementLabelText: NSMutableAttributedString {
        let text = "I agree to the Terms of use and Privacy policy"
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let agreementLabelText = NSMutableAttributedString(string: trimmedText)
        agreementLabelText.setColorForText("I agree to the ", with: Resources.Colors.activeButtonTextColor)
        agreementLabelText.setColorForText(" and ", with: Resources.Colors.activeButtonTextColor)
            
        return agreementLabelText
    }
    
    private let agreementLabel = CustomLabel(
        customText: "",
        fontStyle: "Regular",
        fontSize: 12
    )
    
    let googleButton = CustomSymbolButton(
        orientation: .standart,
        symbolImage: Resources.AppImages.googleButtonImage
    )
    
    let telegramButton = CustomSymbolButton(
        orientation: .standart,
        symbolImage: Resources.AppImages.telegramButtonImage
    )
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        addingSubviews()
        setupConst()
        setupDelegates()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Resources.Colors.backgroundColor
        
        signUpButton.setAlwaysPressed()
        
        emailTextField.addLeftSpacing(width: 10, height: emailTextField.frame.height)
        emailTextField.addRightSpacing(width: 10, height: emailTextField.frame.height)
        
        let passwordTextFields = [passwordTextField, repeatPasswordTextField]
        for element in passwordTextFields {
            element.addLeftSpacing(width: 10, height: element.frame.height)
            element.addRightSpacing(width: 10, height: element.frame.height)
            element.isSecureTextEntry = true
        }
        
        agreementLabel.attributedText = agreementLabelText
        if Resources.ScreenSizes.width < 380 {
            agreementLabel.font = UIFont(name: "Montserrat-Regular", size: 10.5)
        }
    }
    
    private func addingSubviews() {
        let elements = [
            audireLabel, loginButton, signUpButton,
            emailTextField, passwordTextField, repeatPasswordTextField,
            largeSignUpButton, agreeButton, agreementLabel,
            googleButton, telegramButton
        ]
        
        for element in elements {
            addSubview(element)
        }
    }
    
    private func setupConst() {
        audireLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(47 * Resources.Multipliers.multiplierY)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(186 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(123 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(367 * Resources.Multipliers.multiplierY)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(186 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(123 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(367 * Resources.Multipliers.multiplierY)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(185 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(305 * Resources.Multipliers.multiplierY)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalTo(emailTextField.snp.bottom).offset(20 * Resources.Multipliers.multiplierY)
            make.height.equalTo(41 * Resources.Multipliers.multiplierY)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20 * Resources.Multipliers.multiplierY)
            make.height.equalTo(41 * Resources.Multipliers.multiplierY)
        }
        
        largeSignUpButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(451 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(39 * Resources.Multipliers.multiplierY)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(317 * Resources.Multipliers.multiplierX).priority(750)
            make.top.equalToSuperview().inset(369 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(142 * Resources.Multipliers.multiplierY)
            make.width.equalTo(agreeButton.snp.height).priority(1000)
        }
        
        agreementLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(32 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(371 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(145 * Resources.Multipliers.multiplierY)
        }
        
        googleButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(141.5 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(203.5 * Resources.Multipliers.multiplierX).priority(750)
            make.top.equalToSuperview().inset(410 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(98 * Resources.Multipliers.multiplierY)
            make.width.equalTo(googleButton.snp.height).priority(1000)
        }
        
        telegramButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(203.5 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(141.5 * Resources.Multipliers.multiplierX).priority(750)
            make.top.equalToSuperview().inset(410 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(98 * Resources.Multipliers.multiplierY)
            make.width.equalTo(telegramButton.snp.height).priority(1000)
        }
    }
    
    private func setupDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
}

extension SignUpView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
