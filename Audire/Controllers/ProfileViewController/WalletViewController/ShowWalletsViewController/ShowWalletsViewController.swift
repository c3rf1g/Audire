import UIKit
import SnapKit

final class ShowWalletsViewController: UIViewController {
    
    private struct Constants {
        static let cellHeight: CGFloat = 50
    }
    private var testDataForTableView = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    private let showWalletsCellReuseIdentifier = "showWalletsCellReuseIdentifier"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Resources.Colors.backgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WalletsTableViewCell.self, forCellReuseIdentifier: showWalletsCellReuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
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
        self.view.addSubview(tableView)
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
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(92 * multiplierX)
            make.top.equalToSuperview().inset(22 * multiplierY)
            make.height.equalTo(200 * multiplierY)
        }
        
        tableView.rowHeight = Constants.cellHeight * multiplierY
    }
    
    private func addingTargetsandDelegates() {
        createNewWalletButton.addTarget(self, action: #selector(createNewWalletButtonClicked), for: .touchUpInside)
    }
    
    @objc private func createNewWalletButtonClicked() {
        testDataForTableView.append(String(testDataForTableView.count + 1))
        tableView.reloadData()
    }
}

extension ShowWalletsViewController: UITableViewDelegate {
    
}

extension ShowWalletsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testDataForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: showWalletsCellReuseIdentifier, for: indexPath) as? WalletsTableViewCell
        
        cell?.walletName.text! = "Wallet" + testDataForTableView[indexPath.row]
        
        return cell!
    }
}
