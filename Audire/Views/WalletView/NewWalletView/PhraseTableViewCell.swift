import UIKit
import SnapKit

final class PhraseTableViewCell: UITableViewCell {

    var word = CustomLabel(
        customText: "",
        fontStyle: "Regular",
        fontSize: 20
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        contentView.addSubview(word)
        
        word.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
