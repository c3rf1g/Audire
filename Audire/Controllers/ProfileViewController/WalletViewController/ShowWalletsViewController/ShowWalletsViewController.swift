import UIKit
import SnapKit

final class ShowWalletsViewController: UIViewController {
    
    private struct Constants {
        static let cellHeight: CGFloat = 50
        static let numberOfCells = 4
    }
    
    private let walletsCellReuseIdentifier = "walletsCellReuseIdentifier"
    private lazy var walletsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Resources.Colors.backgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WalletsTableViewCell.self, forCellReuseIdentifier: walletsCellReuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        
        if TestData.wallets.count <= Constants.numberOfCells {
            tableView.isScrollEnabled = false
        }
        
        return tableView
    }()
    private let closeButton = CustomSymbolButton(
        orientation: .standart,
        symbolImage: Resources.AppImages.crossButtonImage
    )
    
    private let createNewWalletButton = CustomButton(
        text: "Create new wallet",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    private let importWalletButton = CustomButton(
        text: "Import a wallet",
        fontStyle: "Regular",
        fontSize: 20,
        radius: 10
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.addingSubviews()
        self.addingTargetsandDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupConst()
    }
    
    private func setupUI() {
        self.view.backgroundColor = Resources.Colors.backgroundColor
    }
    
    private func addingSubviews() {
        self.view.addSubview(createNewWalletButton)
        self.view.addSubview(importWalletButton)
        self.view.addSubview(walletsTableView)
        self.view.addSubview(closeButton)
    }
    
    private func setupConst() {
        // MARK: Эти мультиплаеры только для этого контроллера(половина экрана)
        let multiplierX = Double(self.view.frame.width / 428)
        let multiplierY = Double(self.view.frame.height / 501.67)
        
        createNewWalletButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(92 * multiplierX)
            make.top.equalToSuperview().inset(275 * multiplierY)
            make.height.equalTo(30 * multiplierY)
        }
        
        importWalletButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(92 * multiplierX)
            make.top.equalToSuperview().inset(337 * multiplierY)
            make.height.equalTo(30 * multiplierY)
        }
        
        walletsTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(92 * multiplierX)
            make.top.equalToSuperview().inset(22 * multiplierY)
            make.height.equalTo(200 * multiplierY)
        }
        
        walletsTableView.rowHeight = Constants.cellHeight * multiplierY
        
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20 * multiplierX)
            make.trailing.equalToSuperview().inset(392 * multiplierX).priority(750)
            make.top.equalToSuperview().inset(20 * multiplierY)
            make.bottom.equalToSuperview().inset(465.67 * multiplierY)
            make.width.equalTo(closeButton.snp.height).priority(1000)
        }
    }
    
    private func addingTargetsandDelegates() {
        createNewWalletButton.addTarget(self, action: #selector(createNewWalletButtonClicked), for: .touchUpInside)
        importWalletButton.addTarget(self, action: #selector(importWalletButtonClicked), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
    @objc private func createNewWalletButtonClicked() {
       /* TestData.wallets.append("Wallet" + String(TestData.wallets.count + 1))
        walletsTableView.reloadData()
        
        if TestData.wallets.count > Constants.numberOfCells {
            walletsTableView.isScrollEnabled = true
        } */
        self.present(UINavigationController(rootViewController: NewWalletViewController()), animated: true)
    }
    
    @objc private func importWalletButtonClicked() {
        self.present(UINavigationController(rootViewController: ImportWalletViewController()), animated: true)
    }
    
    @objc private func closeButtonPressed() {
        self.dismiss(animated: true)
    }
}

extension ShowWalletsViewController: UITableViewDelegate {
}

extension ShowWalletsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TestData.wallets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: walletsCellReuseIdentifier, for: indexPath) as? WalletsTableViewCell
        
        cell?.walletName.text! = TestData.wallets[indexPath.row]
        
        return cell!
    }
}
