import UIKit
import SnapKit

final class LoginView: UIView {
    
    private let audireLabel = CustomLabel(
        customText: "AUDIRE",
        fontStyle: "Bold",
        fontSize: 36
    )
    
    private var loginButton = CustomButton(
        text: "Login",
        fontStyle: "Regular",
        fontSize: 23,
        radius: 10
    )
    
    let signUpButton = CustomButton(
        text: "Sign up",
        fontStyle: "Regular",
        fontSize: 23,
        radius: 10
    )
    
    let emailTextField = CustomTextField(
        startText: "Email adress",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .email,
        withDoneButton: false
    )
    
    let passwordTextField = CustomTextField(
        startText: "Password",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .defaultType,
        withDoneButton: false
    )
    
    let largeLoginButton = CustomButton(
        text: "Login",
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
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot the password?", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        if Resources.ScreenSizes.width < 380 {
            button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 10)
        } else {
            button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 12)
        }
        
        return button
    }()
    
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
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Resources.Colors.backgroundColor
        
        loginButton.setAlwaysPressed()
        
        emailTextField.addLeftSpacing(width: 10, height: emailTextField.frame.height)
        emailTextField.addRightSpacing(width: 10, height: emailTextField.frame.height)
        
        passwordTextField.addLeftSpacing(width: 10, height: passwordTextField.frame.height)
        passwordTextField.addRightSpacing(width: 10, height: passwordTextField.frame.height)
        passwordTextField.isSecureTextEntry = true
        
        
        agreementLabel.attributedText = agreementLabelText
        agreementLabel.adjustsFontSizeToFitWidth = true
        if Resources.ScreenSizes.width < 380 {
            agreementLabel.font = UIFont(name: "Montserrat-Regular", size: 10.5)
        }
    }
    
    private func addingSubviews() {
        let elements = [
            audireLabel, loginButton, signUpButton,
            emailTextField, passwordTextField, largeLoginButton,
            agreeButton, agreementLabel, forgotPasswordButton,
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
        
        largeLoginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(451 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(39 * Resources.Multipliers.multiplierY)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(317 * Resources.Multipliers.multiplierX).priority(750)
            make.top.equalToSuperview().inset(308 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(203 * Resources.Multipliers.multiplierY)
            make.width.equalTo(agreeButton.snp.height).priority(1000)
        }
        
        agreementLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(32 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(310 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(206 * Resources.Multipliers.multiplierY)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(31 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(204 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(338 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(178 * Resources.Multipliers.multiplierY)
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
}
