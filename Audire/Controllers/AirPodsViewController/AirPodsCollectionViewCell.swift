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
    
    private let headphoneNameLabel: UILabel = {
        let headphoneName = UILabel()
        headphoneName.font = UIFont(name: "Montserrat-Bold", size: 20)
        headphoneName.textColor = .white
        headphoneName.text = "PODS"
        return headphoneName
    }()
    
    private let batteryImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "batteryImage.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
  
    private let batteryLabel: UILabel = {
        let batteryLabel = UILabel()
        batteryLabel.font = UIFont(name: "Montserrat-Bold", size: 20)
        batteryLabel.textColor = .white
        batteryLabel.text = "100"
        batteryLabel.numberOfLines = 0
        batteryLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        return batteryLabel
    }()
    
    private let priceImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "priceImage.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont(name: "Montserrat-Bold", size: 20)
        priceLabel.textColor = .white
        priceLabel.text = "100"
        return priceLabel
    }()
    
    private let lightningImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lightningImage.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let lightningLabel: UILabel = {
        let lightningLabel = UILabel()
        lightningLabel.font = UIFont(name: "Montserrat-Bold", size: 20)
        lightningLabel.textColor = .white
        lightningLabel.text = "100"
        return lightningLabel
    }()
    
    private let speakerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "speakerImage.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let speakerLabel: UILabel = {
        let speakerLabel = UILabel()
        speakerLabel.font = UIFont(name: "Montserrat-Bold", size: 20)
        speakerLabel.textColor = .white
        speakerLabel.text = "100"
        return speakerLabel
    }()
    
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
        contentView.addSubview(headphoneImageView)
        contentView.addSubview(headphoneNameLabel)
        contentView.addSubview(batteryImageView)
        contentView.addSubview(batteryLabel)
        contentView.addSubview(priceImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(lightningImageView)
        contentView.addSubview(lightningLabel)
        contentView.addSubview(speakerImageView)
        contentView.addSubview(speakerLabel)
        contentView.addSubview(arrowImageView)
    }
    
    private func makeConstarints() {
        
        headphoneImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22 * multiplierY)
            make.leading.equalToSuperview().offset(31 * multiplierX)
            make.trailing.equalToSuperview().inset(230 * multiplierX)
            make.bottom.equalToSuperview().inset(35 * multiplierY)
        }
        
        headphoneNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22 * multiplierY)
            make.leading.equalToSuperview().offset(155 * multiplierX)
            make.trailing.equalToSuperview().inset(5 * multiplierX)
        }
        
        batteryImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalToSuperview().offset(62 * multiplierY)
            make.leading.equalToSuperview().offset(150 * multiplierX)
        }
        
        batteryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(63 * multiplierY)
            make.leading.equalToSuperview().offset(187 * multiplierX)
            make.trailing.equalTo(priceImageView).inset(35 * multiplierX)
        }
        
        priceImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalToSuperview().offset(62 * multiplierY)
            make.leading.equalToSuperview().offset(249 * multiplierX)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(63 * multiplierY)
            make.leading.equalToSuperview().offset(286 * multiplierX)
            make.trailing.equalToSuperview().inset(5 * multiplierX)
           
        }
        
        lightningImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalToSuperview().offset(103 * multiplierY)
            make.leading.equalToSuperview().offset(150 * multiplierX)
        }
        
        lightningLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(104 * multiplierY)
            make.leading.equalToSuperview().offset(187 * multiplierX)
            make.trailing.equalTo(speakerImageView).inset(35 * multiplierX)
        }
        
        speakerImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalToSuperview().offset(103 * multiplierY)
            make.leading.equalToSuperview().offset(249 * multiplierX)
        }
        
        speakerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(104 * multiplierY)
            make.leading.equalToSuperview().offset(286 * multiplierX)
            make.trailing.equalToSuperview().inset(5 * multiplierX)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.width.equalTo(7)
            make.height.equalTo(16)
            make.top.equalToSuperview().offset(74 * multiplierY)
            make.leading.equalToSuperview().offset(345 * multiplierX)
            make.trailing.equalToSuperview().inset(16 * multiplierX)
        }
    }
}
