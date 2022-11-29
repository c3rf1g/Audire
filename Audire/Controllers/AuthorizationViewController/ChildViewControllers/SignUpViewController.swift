import UIKit
import SnapKit

final class SignUpViewController: UIViewController {
    
    private let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTargets()
        setupDelegates()
        self.view = signUpView
        view.backgroundColor = Resources.Colors.backgroundColor
    }
    
    private func setupTargets() {
        signUpView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        signUpView.agreeButton.addTarget(self, action: #selector(agreeButtonClicked), for: .touchUpInside)
        signUpView.googleButton.addTarget(self, action: #selector(googleButtonClicked), for: .touchUpInside)
        signUpView.telegramButton.addTarget(self, action: #selector(telegramButtonClicked), for: .touchUpInside)
    }
    
    private func setupDelegates() {
        signUpView.emailTextField.delegate = self
        signUpView.passwordTextField.delegate = self
        signUpView.repeatPasswordTextField.delegate = self
    }
    
    @objc private func loginButtonClicked() {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    @objc private func agreeButtonClicked() {
        if signUpView.agreeButton.counter % 2 != 0 {
            signUpView.largeSignUpButton.addTargets()
            signUpView.largeSignUpButton.addTarget(self, action: #selector(largeSignUpButtonClicked), for: .touchUpInside)
        } else {
            signUpView.largeSignUpButton.removeAllTargets()
            signUpView.largeSignUpButton.removeTarget(self, action: #selector(largeSignUpButtonClicked), for: .touchUpInside)
        }
    }
    
    @objc private func googleButtonClicked() {
        UIApplication.shared.open(URL(string: "https://www.google.com")!)
    }
    
    @objc private func telegramButtonClicked() {
        UIApplication.shared.open(URL(string: "https://t.me/audirecontest_bot?start=855520689")!)
    }
    
    @objc private func largeSignUpButtonClicked() {
        
        let correctEmail = signUpView.emailTextField.text?.contains("@")
        let correctPasswords = (signUpView.passwordTextField.text == signUpView.repeatPasswordTextField.text) && signUpView.passwordTextField.text != ""
        
        if (correctEmail ?? false) && correctPasswords {
            let tabBarController = MainTabBarViewController()
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true)
        }

        if !(correctEmail ?? true) {
            signUpView.emailTextField.textColor = .red
            signUpView.emailTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if !correctPasswords {
            signUpView.passwordTextField.textColor = .red
            signUpView.passwordTextField.layer.borderColor = UIColor.red.cgColor
            signUpView.repeatPasswordTextField.textColor = .red
            signUpView.repeatPasswordTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textFields = [
            signUpView.emailTextField,
            signUpView.passwordTextField,
            signUpView.repeatPasswordTextField
        ]
        
        for element in textFields {
            element.textColor = .white
            element.layer.borderColor = UIColor.white.cgColor
        }
    }
}
