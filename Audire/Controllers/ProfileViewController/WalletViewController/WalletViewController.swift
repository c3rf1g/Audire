import Foundation
import UIKit
import SnapKit

final class WalletViewController: UIViewController {
    private let walletView = WalletView()
    private let navBarView = NavigationBarView(withBackButton: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradientLayer()
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
    }
    
    private func addingSubviews() {
        self.view.addSubview(walletView)
        self.view.addSubview(navBarView)
    }
    
    private func setupConst() {
        walletView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        makeConstraintsForNavigationBarView(navBar: navBarView)
    }
    
    private func addingTargets() {
        navBarView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
       
        walletView.showWalletsButton.addTarget(self, action: #selector(showWalletsButtonUnclicked), for: .touchUpInside)
    }
    
    @objc private func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func showWalletsButtonUnclicked() {
        let viewController = ShowWalletsViewController()
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        
        self.present(viewController, animated: true)
    }
}
