import Foundation
import UIKit
import SnapKit

final class NewWalletViewController: UIViewController {
    
    private var newWalletView = NewWalletView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.addingSubviews()
        self.setupTargetsAndDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setupConst()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private func setupUI() {
        createGradientLayer()
    }
    
    private func addingSubviews() {
        self.navigationController?.navigationBar.removeFromSuperview()
        self.view.addSubview(newWalletView)
    }
    
    private func setupConst() {
        newWalletView.setupSelfConst(
            multiplierX: anyPresentControllerMultiplierX,
            multiplierY: largePresentControllerMultiplierY
        )
        
        newWalletView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func setupTargetsAndDelegates() {
        newWalletView.closeButton.addTarget(self, action: #selector(closeButtonClicked), for: .touchUpInside)
        newWalletView.createWalletButton.addTarget(self, action: #selector(createWalletButtonClicked), for: .touchUpInside)
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc private func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    @objc private func createWalletButtonClicked() {
        self.navigationController?.pushViewController(EnterSecretPhraseViewController(), animated: true)
    }
}
