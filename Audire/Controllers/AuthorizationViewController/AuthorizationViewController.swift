import UIKit
import SnapKit

final class AuthorizationViewController: UIViewController {
    
    private let childVC = UINavigationController(rootViewController: LoginViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        add(childVC)
        setupConst()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private func setupUI() {
        createGradientLayer()
        childVC.view.layer.cornerRadius = 10 * Resources.Multipliers.multiplierX
    }
    
    private func setupConst() {
        childVC.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(184 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(211 * Resources.Multipliers.multiplierY)
        }
    }
}
