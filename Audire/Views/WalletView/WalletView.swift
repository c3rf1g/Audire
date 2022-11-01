import UIKit
import SnapKit
import Foundation

final class WalletView: UIView {
    private struct Constants {
        static let cellHeight: CGFloat = 41
        static let numberOfCells = 8
        static let maxBalanceValue: Double = 1000000
    }
    
    private let walletLabel = CustomLabel(
        customText: "Wallet1",
        fontStyle: "Bold",
        fontSize: 24
    )
    private let balanceLabel = CustomLabel(
        customText: "Balance",
        fontStyle: "Light",
        fontSize: 24
    )
    
    private let tokenBalanceLabel = CustomLabel(
        customText: "1680.21",
        fontStyle: "Bold",
        fontSize: 48
    )
    
    private let tokenImageView = UIImageView(image: Resources.AppImages.mainTokenLarge)
    
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
    
    private let balancesCellReuseIdentifier = "balancesCellReuseIdentifier"
    private lazy var balancesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BalancesTableViewCell.self, forCellReuseIdentifier: balancesCellReuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        
        if TestData.balancesTokenNames.count <= Constants.numberOfCells {
            tableView.isScrollEnabled = false
        }
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addingSubviews()
        self.setupConst()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addingSubviews() {
        let elementsArray = [
            walletLabel, balanceLabel, tokenBalanceLabel,
            tokenImageView, tradeButton, transferButton,
            showWalletsButton, balancesTableView
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
        
        let doubleTokenBalance = Double(tokenBalanceLabel.text ?? "0") ?? 0
        
        if doubleTokenBalance >= Constants.maxBalanceValue {
            tokenBalanceLabel.text = "\(Int(round(doubleTokenBalance / 1000)))k"
        }
        
        tokenBalanceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(260 * Resources.Multipliers.multiplierY)
            make.centerX.equalTo(189.5 * Resources.Multipliers.multiplierX)
        }
        
        tokenImageView.snp.makeConstraints { make in
            make.centerY.equalTo(tokenBalanceLabel.snp.centerY)
            make.leading.equalTo(tokenBalanceLabel.snp.trailing).offset(10 * Resources.Multipliers.multiplierX)
            make.height.width.equalTo(tokenBalanceLabel.font.pointSize - 4)
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
        
        balancesTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(455 * Resources.Multipliers.multiplierY)
            make.height.equalTo(328 * Resources.Multipliers.multiplierY)
        }
        
        balancesTableView.rowHeight = Constants.cellHeight * Resources.Multipliers.multiplierY
    }
}

extension WalletView: UITableViewDelegate {
    
}

extension WalletView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TestData.balancesTokenNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: balancesCellReuseIdentifier, for: indexPath) as? BalancesTableViewCell
        
        cell?.tokenImageView.image = TestData.balanceTokenImages[indexPath.row]
        cell?.tokenImageView.tintColor = TestData.balanceTokenImageViewColors[indexPath.row]
        cell?.tokenName.text! = TestData.balancesTokenNames[indexPath.row]
        cell?.tokenBalance.text! = TestData.tokenBalances[indexPath.row]
        
        return cell!
    }
}
