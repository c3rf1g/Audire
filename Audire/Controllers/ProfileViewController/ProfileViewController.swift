import Foundation
import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    private let navBarView = NavigationBarView(withBackButton: false)
    private let profileView = ProfileView()

        override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradientLayer()
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
    }
    
    private func addingSubviews() {
        self.navigationController?.navigationBar.removeFromSuperview()
        self.view.addSubview(profileView)
        self.view.addSubview(navBarView)
    }
    
    private func setupConst() {
        profileView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        makeConstraintsForNavigationBarView(navBar: navBarView)
    }
    
    private func addingTargets() {
        self.profileView.walletButton.addTarget(
            self,
            action: #selector(walletButtonClicked),
            for: .touchUpInside
        )
        self.profileView.accountButton.addTarget(
            self,
            action: #selector(accountButtonClicked),
            for: .touchUpInside
        )
        self.profileView.settingsButton.addTarget(
            self,
            action: #selector(settingsButtonClicked),
            for: .touchUpInside
        )
        self.profileView.aboutButton.addTarget(
            self,
            action: #selector(aboutButtonClicked),
            for: .touchUpInside
        )
    }
    
    @objc private func walletButtonClicked() {
        self.navigationController?.pushViewController(WalletViewController(), animated: true)
    }
    
    @objc private func accountButtonClicked() {
        self.navigationController?.pushViewController(WalletViewController(), animated: true)
    }
    
    @objc private func settingsButtonClicked() {
        self.navigationController?.pushViewController(WalletViewController(), animated: true)
    }
    
    @objc private func aboutButtonClicked() {
        self.navigationController?.pushViewController(WalletViewController(), animated: true)
    }
}
