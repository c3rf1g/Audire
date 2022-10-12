import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
