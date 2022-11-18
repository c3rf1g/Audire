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
        loginView.largeLoginButton.addTarget(self, action: #selector(largeLoginButtonClicked), for: .touchUpInside)
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
    
    @objc private func largeLoginButtonClicked() {
        let tabBarController = MainTabBarViewController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true)
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case loginView.emailTextField:
            if !TestData.loginAndPassword.keys.contains(textField.text ?? "") && textField.text != "" {
                loginView.emailTextField.textColor = .red
                loginView.emailTextField.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
        case loginView.passwordTextField:
            if !TestData.loginAndPassword.values.contains(textField.text ?? "") && textField.text != "" {
                loginView.passwordTextField.textColor = .red
                loginView.passwordTextField.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
        default: break
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .white
    }
}
