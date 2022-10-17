import Foundation
import UIKit
import SnapKit

final class WalletViewController: UIViewController {
    private struct Constants {
        static let screenWidthForChangingFontSize: CGFloat = 380
    }
    private let methods = Methods()
    
    private let navBarView = NavigationBarView(withBackButton: true)
    private let walletLabel = CustomLabel(
        customText: "Wallet",
        fontStyle: "Bold",
        fontSize: 24
    )
    private let balanceLabel = CustomLabel(
        customText: "Balance",
        fontStyle: "Light",
        fontSize: 24
    )
    
    private let tradeButton = CustomButton(
        text: "Trade",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    private let transferButton = CustomButton(
        text: "Transfer",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    
    private let showWalletsButton: UIButton = {
        let button = UIButton()
        let iconImage = Resources.AppImages.showWalletsButtonImage?.withRenderingMode(.alwaysTemplate)
        let iconImageView = UIImageView(image: iconImage)
        iconImageView.tintColor = .white
        
        button.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(8 * Resources.Multipliers.multiplierY)
            make.center.equalToSuperview()
        }
        button.sendSubviewToBack(iconImageView)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
    }
    
    private func setupUI() {
        self.view.backgroundColor = Resources.Colors.backgroundColor
    }
    
    private func addingSubviews() {
        let elementsArray = [
            navBarView, walletLabel,
            balanceLabel, tradeButton,
            transferButton, showWalletsButton
        ]
        for element in elementsArray {
            self.view.addSubview(element)
        }
    }
    
    private func setupConst() {
        methods.makeConstraintsForNavigationBarView(navBar: navBarView, addingToViewController: self)
        
        walletLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(314 * Resources.Multipliers.multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(143 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(754 * Resources.Multipliers.multiplierY)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(301 * Resources.Multipliers.multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(202 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(695 * Resources.Multipliers.multiplierY)
        }
        
        tradeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(229 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(348 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(548 * Resources.Multipliers.multiplierY)
        }
        
        transferButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(229 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(348 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(548 * Resources.Multipliers.multiplierY)
        }
        
        showWalletsButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(362 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(149 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(759 * Resources.Multipliers.multiplierY)
        }
    }
    
    private func addingTargets() {
        navBarView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        showWalletsButton.addTarget(self, action: #selector(showWalletsButtonUnclicked), for: .touchUpInside)
        showWalletsButton.addTarget(self, action: #selector(showWalletsButtonClicked), for: .touchDown)
    }
    
    @objc private func backButtonClicked() {
        let tabBarController = MainTabBarViewController()
        tabBarController.selectedIndex = 2
        methods.settingAnimation(direction: .fromLeft, usingView: self.view)
        methods.presentViewController(newVC: tabBarController, oldVC: self, withStyle: .fullScreen)
    }
    
    @objc private func showWalletsButtonClicked() {
        showWalletsButton.subviews[0].tintColor = Resources.Colors.activeButtonTextColor
    }
    
    @objc private func showWalletsButtonUnclicked() {
        showWalletsButton.subviews[0].tintColor = .white
        
        let viewController = ShowWalletsViewController()
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        self.present(viewController, animated: true)
    }
}
