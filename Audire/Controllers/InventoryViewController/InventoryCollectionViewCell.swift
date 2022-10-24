import UIKit
import SnapKit

class InventoryCollectionViewCell: UICollectionViewCell {
    private struct Constants {
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 15
        static let shadowRadius: CGFloat = 6
        static let shadowOpacity: Float = 1
    }
    
    static let identifier = "AirPodsCell"
    
    private let headphoneImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.airpods
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let headphoneNameLabel = CustomLabel(
        customText: "Pods",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let batteryImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.batteryImage
        image.contentMode = .scaleAspectFit
        return image
    }()
  
    private let batteryLabel = CustomLabel(
        customText: "100",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let priceImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.priceImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let priceLabel = CustomLabel(
        customText: "100",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let lightningImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.lightningImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let lightningLabel = CustomLabel(
        customText: "100",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let speakerImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.speakerImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let speakerLabel = CustomLabel(
        customText: "100",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.arrowButtonImage?.withHorizontallyFlippedOrientation()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setupAppereance()
        makeConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupAppereance() {
        contentView.backgroundColor = Resources.Colors.backgroundColor
        contentView.layer.borderWidth = Constants.borderWidth
        contentView.layer.cornerRadius = Constants.cornerRadius
        contentView.layer.borderColor = Resources.Colors.borderHeadphones.cgColor
        contentView.layer.shadowColor = Resources.Colors.borderHeadphones.cgColor
        contentView.layer.shadowRadius = Constants.shadowRadius
        contentView.layer.shadowOpacity = Constants.shadowOpacity
        contentView.layer.shadowOffset = .zero
        
    }
    
    private func addViews() {
        
        let items =
        [
            headphoneImageView, headphoneNameLabel, batteryImageView, batteryLabel,
            priceImageView, priceLabel, lightningImageView, lightningLabel,
            speakerImageView, speakerLabel, arrowImageView
        ]
        
        for item in items {
            contentView.addSubview(item)
        }
    }
    
    private func makeConstarints() {
        
        headphoneImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22 * Resources.Multipliers.multiplierY)
            make.leading.equalToSuperview().offset(31 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(230 * Resources.Multipliers.multiplierX)
            make.bottom.equalToSuperview().inset(35 * Resources.Multipliers.multiplierY)
        }
        
        headphoneNameLabel.snp.makeConstraints { make in
            make.top.equalTo(headphoneImageView.snp.top)
            make.leading.equalTo(headphoneImageView.snp.trailing).offset(17 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(5 * Resources.Multipliers.multiplierX)
            make.bottom.equalToSuperview().inset(123 * Resources.Multipliers.multiplierY)
        }
        
        batteryImageView.snp.makeConstraints { make in
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.top.equalTo(headphoneNameLabel.snp.bottom).offset(10 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(headphoneImageView.snp.trailing).offset(12 * Resources.Multipliers.multiplierX)
            
        }
        
        batteryLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(batteryImageView)
            make.leading.equalTo(batteryImageView.snp.trailing).offset(7 * Resources.Multipliers.multiplierX)
        }
        
        priceImageView.snp.makeConstraints { make in
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.top.equalTo(batteryImageView)
            make.leading.equalTo(batteryImageView.snp.trailing).offset(73 * Resources.Multipliers.multiplierX)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(priceImageView)
            make.leading.equalTo(priceImageView.snp.trailing).offset(7 * Resources.Multipliers.multiplierX)
        }
        
        lightningImageView.snp.makeConstraints { make in
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.top.equalTo(batteryImageView.snp.bottom).offset(15 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(batteryImageView)
            
        }
        
        lightningLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(lightningImageView)
            make.leading.equalTo(batteryLabel)
        }
        
        speakerImageView.snp.makeConstraints { make in
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.top.equalTo(lightningImageView)
            make.leading.equalTo(priceImageView)
        }
        
        speakerLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(speakerImageView)
            make.leading.equalTo(priceLabel)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.width.equalTo(7 * Resources.Multipliers.multiplierX)
            make.height.equalTo(16 * Resources.Multipliers.multiplierY)
            make.top.equalToSuperview().offset(74 * Resources.Multipliers.multiplierY)
            make.trailing.equalToSuperview().inset(11 * Resources.Multipliers.multiplierX)
        }
    }
}
