import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTargets()
        setupDelegates()
        self.view = loginView
        self.navigationController?.navigationBar.removeFromSuperview()
    }
    
    private func setupTargets() {
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        loginView.agreeButton.addTarget(self, action: #selector(agreeButtonClicked), for: .touchUpInside)
        loginView.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonClicked), for: .touchUpInside)
        loginView.googleButton.addTarget(self, action: #selector(googleButtonClicked), for: .touchUpInside)
        loginView.telegramButton.addTarget(self, action: #selector(telegramButtonClicked), for: .touchUpInside)
    }
    
    private func setupDelegates() {
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    @objc private func signUpButtonClicked() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: false)
    }
    
    @objc private func agreeButtonClicked() {
        if loginView.agreeButton.counter % 2 != 0 {
            loginView.largeLoginButton.addTargets()
            loginView.largeLoginButton.addTarget(self, action: #selector(largeLoginButtonClicked), for: .touchUpInside)
        } else {
            loginView.largeLoginButton.removeAllTargets()
            loginView.largeLoginButton.removeTarget(self, action: #selector(largeLoginButtonClicked), for: .touchUpInside)
        }
    }
    
    @objc private func largeLoginButtonClicked() {
        
        let result = TestData.loginAndPassword[loginView.emailTextField.text ?? ""] == loginView.passwordTextField.text
        
        if result {
            let tabBarController = MainTabBarViewController()
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true)
        } else {
            loginView.emailTextField.textColor = .red
            loginView.emailTextField.layer.borderColor = UIColor.red.cgColor
            loginView.passwordTextField.textColor = .red
            loginView.passwordTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @objc private func forgotPasswordButtonClicked() {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=IEKM7EoGbHU")!)
    }
    
    @objc private func googleButtonClicked() {
        UIApplication.shared.open(URL(string: "https://www.google.com")!)
    }
    
    @objc private func telegramButtonClicked() {
        UIApplication.shared.open(URL(string: "https://t.me/audirecontest_bot?start=855520689")!)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textFields = [
            loginView.emailTextField,
            loginView.passwordTextField
        ]
        
        for element in textFields {
            element.textColor = .white
            element.layer.borderColor = UIColor.white.cgColor
        }
    }
}
