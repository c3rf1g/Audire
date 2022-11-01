import Foundation
import UIKit
import SnapKit

final class EnterSecretPhraseViewController: UIViewController {
    private var enterSecretPhraseView = EnterSecretPhraseView()
    
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
    
    private func setupUI() {
        createGradientLayer()
    }
    
    private func addingSubviews() {
        self.navigationController?.navigationBar.removeFromSuperview()
        self.view.addSubview(enterSecretPhraseView)
    }
    
    private func setupConst() {
        enterSecretPhraseView.setupSelfConst(
            multiplierX: anyPresentControllerMultiplierX,
            multiplierY: largePresentControllerMultiplierY
        )
        
        enterSecretPhraseView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func setupTargetsAndDelegates() {
        enterSecretPhraseView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        enterSecretPhraseView.confirmButton.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
    }
    
    @objc private func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func confirmButtonClicked() {
        self.dismiss(animated: true)
    }
}
