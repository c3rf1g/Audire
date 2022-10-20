import UIKit
import SnapKit

final class WalletsTableViewCell: UITableViewCell {

    public var walletName = CustomLabel(
        customText: "",
        fontStyle: "Regular",
        fontSize: 20
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = Resources.Colors.backgroundColor
        self.selectionStyle = .none
        
        contentView.addSubview(walletName)
        
        walletName.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
