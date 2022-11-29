import Foundation
import UIKit
import SnapKit

final class BalancesTableViewCell: UITableViewCell {
    
    var tokenImageView = UIImageView(image: nil)
    var tokenName = CustomLabel(
        customText: "",
        fontStyle: "Bold",
        fontSize: 20
    )
    var tokenBalance = CustomLabel(
        customText: "",
        fontStyle: "Regular",
        fontSize: 20
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
        self.addingSubviews()
        self.setupConst()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func addingSubviews() {
        contentView.addSubview(tokenImageView)
        contentView.addSubview(tokenName)
        contentView.addSubview(tokenBalance)
    }
    
    private func setupConst() {
       tokenImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(342 * Resources.Multipliers.multiplierX).priority(750)
            make.top.bottom.equalToSuperview().inset(7.5 * Resources.Multipliers.multiplierY)
            make.width.equalTo(tokenImageView.snp.height).priority(1000)
        } 
        
        tokenName.snp.makeConstraints { make in
            make.leading.equalTo(tokenImageView.snp.trailing).offset(20 * Resources.Multipliers.multiplierX)
            make.centerY.equalToSuperview()
        }
        
        tokenBalance.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
