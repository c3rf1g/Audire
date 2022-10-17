import UIKit
import SnapKit

class WalletsTableViewCell: UITableViewCell {

    public let walletName = CustomLabel(
        customText: "Wallet1",
        fontStyle: "Regular",
        fontSize: 20
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = Resources.Colors.backgroundColor
        self.selectionStyle = .none
        
        contentView.addSubview(walletName)
        
        walletName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
