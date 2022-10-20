import Foundation
import UIKit
import SnapKit

final class ViewController: UIViewController {
    private let methods = Methods()
    private let profile = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
    }
    
    private func addingSubviews() {
        self.view.addSubview(profile)
    }
    
    private func setupConst() {
        profile.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func addingTargets() {
        self.profile.walletButton.addTarget(
            self,
            action: #selector(walletButtonClicked),
            for: .touchUpInside
        )
        self.profile.accountButton.addTarget(
            self,
            action: #selector(accountButtonClicked),
            for: .touchUpInside
        )
        self.profile.settingsButton.addTarget(
            self,
            action: #selector(settingsButtonClicked),
            for: .touchUpInside
        )
        self.profile.aboutButton.addTarget(
            self,
            action: #selector(aboutButtonClicked),
            for: .touchUpInside
        )
    }
    
    @objc private func walletButtonClicked() {
        methods.settingAnimation(direction: .fromRight, usingView: self.view)
        methods.presentViewController(newVC: WalletViewController(), oldVC: self, withStyle: .fullScreen)
    }
    
    @objc private func accountButtonClicked() {
        methods.settingAnimation(direction: .fromRight, usingView: self.view)
        methods.presentViewController(newVC: WalletViewController(), oldVC: self, withStyle: .fullScreen)
    }
    
    @objc private func settingsButtonClicked() {
        methods.settingAnimation(direction: .fromRight, usingView: self.view)
        methods.presentViewController(newVC: WalletViewController(), oldVC: self, withStyle: .fullScreen)
    }
    
    @objc private func aboutButtonClicked() {
        methods.settingAnimation(direction: .fromRight, usingView: self.view)
        methods.presentViewController(newVC: WalletViewController(), oldVC: self, withStyle: .fullScreen)
    }
}
