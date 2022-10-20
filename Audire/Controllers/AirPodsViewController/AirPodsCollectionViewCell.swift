import UIKit
import SnapKit

class AirPodsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AirPodsCell"
    
    private let multiplierX = Double(UIScreen.main.bounds.size.width / 428)
    private let multiplierY = Double(UIScreen.main.bounds.size.height / 926)
    
    private let headphoneImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "airpods")
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
        image.image = UIImage(named: "batteryImage.png")
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
        image.image = UIImage(named: "priceImage.png")
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
        image.image = UIImage(named: "lightningImage.png")
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
        image.image = UIImage(named: "speakerImage.png")
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
        image.image = UIImage(named: "arrowImage.png")
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
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = Resources.Colors.borderHeadphones.cgColor
        contentView.layer.shadowColor = Resources.Colors.borderHeadphones.cgColor
        contentView.layer.shadowRadius = 6
        contentView.layer.shadowOpacity = 1
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
            make.top.equalToSuperview().offset(22 * multiplierY)
            make.leading.equalToSuperview().offset(31 * multiplierX)
            make.trailing.equalToSuperview().inset(230 * multiplierX)
            make.bottom.equalToSuperview().inset(35 * multiplierY)
        }
        
        headphoneNameLabel.snp.makeConstraints { make in
            make.top.equalTo(headphoneImageView.snp.top)
            make.leading.equalTo(headphoneImageView.snp.trailing).offset(17 * multiplierX)
            make.trailing.equalToSuperview().inset(5 * multiplierX)
        }
        
        batteryImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(headphoneNameLabel.snp.bottom).offset(21 * multiplierY)
            make.leading.equalTo(headphoneImageView.snp.trailing).offset(12 * multiplierX)
        }
        
        batteryLabel.snp.makeConstraints { make in
            make.top.equalTo(batteryImageView)
            make.leading.equalTo(batteryImageView.snp.trailing).offset(11 * multiplierX)
        }
        
        priceImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(batteryImageView)
            make.leading.equalTo(batteryImageView.snp.trailing).offset(73 * multiplierX)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceImageView)
            make.leading.equalTo(priceImageView.snp.trailing).offset(11 * multiplierX)
           
        }
        
        lightningImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(batteryImageView.snp.bottom).offset(15)
            make.leading.equalTo(batteryImageView)
        }
        
        lightningLabel.snp.makeConstraints { make in
            make.top.equalTo(lightningImageView)
            make.leading.equalTo(batteryLabel)
        }
        
        speakerImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(lightningImageView)
            make.leading.equalTo(priceImageView)
        }
        
        speakerLabel.snp.makeConstraints { make in
            make.top.equalTo(speakerImageView)
            make.leading.equalTo(priceLabel)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.width.equalTo(7)
            make.height.equalTo(16)
            make.top.equalToSuperview().offset(74 * multiplierY)
            make.leading.equalTo(priceImageView.snp.trailing).offset(70 * multiplierX)
            make.trailing.equalToSuperview().inset(16 * multiplierX)
        }
    }
}
