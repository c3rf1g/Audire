import Foundation
import UIKit
import SnapKit

final class ImportWalletViewController: UIViewController {
    
    private var importWalletView = ImportWalletView()
    
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
        self.view.addSubview(importWalletView)
    }
    
    private func setupConst() {
        importWalletView.setupSelfConst(
            multiplierX: anyPresentControllerMultiplierX,
            multiplierY: largePresentControllerMultiplierY
        )
        
        importWalletView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func setupTargetsAndDelegates() {
        importWalletView.closeButton.addTarget(self, action: #selector(closeButtonClicked), for: .touchUpInside)
        importWalletView.importWalletButton.addTarget(self, action: #selector(importWalletButtonClicked), for: .touchUpInside)
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc private func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    @objc private func importWalletButtonClicked() {
        self.dismiss(animated: true)
    }
}
