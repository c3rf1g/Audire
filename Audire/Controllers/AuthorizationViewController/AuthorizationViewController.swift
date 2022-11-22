import UIKit
import SnapKit

final class AuthorizationViewController: UIViewController {
    private struct Constants {
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 10
        static let shadowRadius: CGFloat = 10
        static let shadowOpacity: Float = 1
    }
    
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
        childVC.view.layer.cornerRadius = Constants.cornerRadius * Resources.Multipliers.multiplierX
        childVC.view.layer.borderWidth = Constants.borderWidth
        childVC.view.layer.borderColor = Resources.Colors.profileAtarBorderColor.cgColor
        childVC.view.layer.shadowColor = Resources.Colors.borderHeadphones.cgColor
        childVC.view.layer.shadowRadius = Constants.shadowRadius
        childVC.view.layer.shadowOpacity = Constants.shadowOpacity
        childVC.view.layer.shadowOffset = .zero
        childVC.view.layer.masksToBounds = false
    }
    
    private func setupConst() {
        childVC.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(184 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(211 * Resources.Multipliers.multiplierY)
        }
    }
}
