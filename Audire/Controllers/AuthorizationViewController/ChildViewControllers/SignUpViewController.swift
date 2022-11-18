import UIKit
import SnapKit

final class SignUpViewController: UIViewController {
    
    private let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTargets()
        self.view = signUpView
        view.backgroundColor = Resources.Colors.backgroundColor
    }
    
    private func setupTargets() {
        signUpView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    @objc private func loginButtonClicked() {
        self.navigationController?.popToRootViewController(animated: false)
    }
}
