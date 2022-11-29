import UIKit
import SnapKit

final class WalletView: UIView {
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
    
    let tradeButton = CustomButton(
        text: "Trade",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    let transferButton = CustomButton(
        text: "Transfer",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    
    let showWalletsButton = CustomSymbolButton(
        orientation: .standart,
        symbolImage: Resources.AppImages.showWalletsButtonImage
    )
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setupUI()
        self.addingSubviews()
        self.setupConst()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
    }
    
    private func addingSubviews() {
        let elementsArray = [
            walletLabel, balanceLabel, tradeButton,
            transferButton, showWalletsButton
        ]
        for element in elementsArray {
            self.addSubview(element)
        }
    }
    
    private func setupConst() {
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
            make.top.equalToSuperview().inset(154 * Resources.Multipliers.multiplierY)
            make.bottom.equalToSuperview().inset(764 * Resources.Multipliers.multiplierY)
        }
    }
}
