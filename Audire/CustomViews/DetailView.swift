import UIKit
import SnapKit

final class DetailView: UIView {
    
    private let multiplierX = Double(UIScreen.main.bounds.size.width / 428)
    private let multiplierY = Double(UIScreen.main.bounds.size.height / 926)
    
    private let headphoneNameLabel = CustomLabel(
        customText: "Pods",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let headphoneImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "airpods")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let headphoneCode = CustomLabel(
        customText: "#433441",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let headphoneTypeOfConnect = CustomLabel(
        customText: "Wireless",
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
    
    private let tokenImageViewFirst: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainTokenLarge.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let tokenImageViewSecond: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainTokenLarge.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let chargeLabel = CustomLabel(
        customText: "147.28",
        fontStyle: "Bold",
        fontSize: 20
    )
    
    private let chargeButton = CustomButton(
        text: "Charge",
        fontStyle: "Bold",
        fontSize: 20,
        radius: 5
    )
    
    private let sellButton = CustomButton(
        text: "Sell",
        fontStyle: "Bold",
        fontSize: 20,
        radius: 5
    )
    
    private let equipButton = CustomButton(
        text: "Equip",
        fontStyle: "Bold",
        fontSize: 20,
        radius: 5)
    
    private let sellTextField = CustomTextField(startText: "00.00", fontStyle: "Bold", fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addViews()
        self.makeConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addViews() {
        let items =
        [
            headphoneImageView, headphoneNameLabel, headphoneCode, headphoneTypeOfConnect,
            batteryImageView, batteryLabel, priceImageView, priceLabel,
            lightningImageView, lightningLabel, speakerImageView, speakerLabel,
            tokenImageViewFirst, tokenImageViewSecond, chargeLabel, equipButton,
            chargeButton, sellButton, sellTextField
        ]
        
        for item in items {
            addSubview(item)
        }
    }
    
    private func makeConstarints() {
        
        headphoneNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(143 * multiplierY)
            make.leading.equalToSuperview().offset(30 * multiplierX)
            make.trailing.equalToSuperview().inset(278 * multiplierX)
            make.bottom.equalToSuperview().inset(754 * multiplierY)
        }
        
        headphoneCode.snp.makeConstraints { make in
            make.top.equalTo(headphoneNameLabel.snp.bottom).offset(34)
            make.leading.equalTo(headphoneNameLabel)
        }
        headphoneTypeOfConnect.snp.makeConstraints { make in
            make.top.equalTo(headphoneCode)
            make.trailing.equalToSuperview().inset(30)
        }
        
        headphoneImageView.snp.makeConstraints { make in
            make.top.equalTo(headphoneCode).offset(41 * multiplierY)
            make.leading.equalTo(headphoneCode)
            make.trailing.equalToSuperview().inset(154 * multiplierX)
            make.bottom.equalToSuperview().inset(416 * multiplierY)
        }
        
        batteryImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(headphoneTypeOfConnect.snp.bottom).offset(97 * multiplierY)
            make.leading.equalTo(headphoneImageView.snp.trailing).offset(36 * multiplierY)
        }
        
       batteryLabel.snp.makeConstraints { make in
            make.top.equalTo(batteryImageView)
            make.leading.equalTo(batteryImageView.snp.trailing).offset(13 * multiplierX)
        }
        
        lightningImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(batteryImageView.snp.bottom).offset(15 * multiplierY)
            make.leading.equalTo(batteryImageView)
        }
        
        lightningLabel.snp.makeConstraints { make in
            make.top.equalTo(lightningImageView)
            make.leading.equalTo(batteryLabel)
        }
        
        priceImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(lightningImageView.snp.bottom).offset(15 * multiplierY)
            make.leading.equalTo(lightningImageView)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceImageView)
            make.leading.equalTo(priceImageView.snp.trailing).offset(11 * multiplierX)
           
        }
        
        speakerImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
            make.top.equalTo(priceImageView.snp.bottom).offset(15 * multiplierY)
            make.leading.equalTo(priceImageView)
        }
        
        speakerLabel.snp.makeConstraints { make in
            make.top.equalTo(speakerImageView)
            make.leading.equalTo(priceLabel)
        }
        
        tokenImageViewFirst.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(553 * multiplierY)
            make.leading.equalToSuperview().offset(355 * multiplierX)
        }
        
        tokenImageViewSecond.snp.makeConstraints { make in
            make.top.equalTo(tokenImageViewFirst.snp.bottom).offset(20 * multiplierY)
            make.trailing.equalTo(tokenImageViewFirst)
        }
        
        chargeLabel.snp.makeConstraints { make in
            make.top.equalTo(tokenImageViewFirst).offset(20 * multiplierY)
            make.trailing.equalTo(tokenImageViewFirst.snp.leading).inset(-12 * multiplierX)
        }
        
        chargeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(553 * multiplierY)
            make.bottom.equalToSuperview().inset(332 * multiplierY)
            make.leading.equalToSuperview().offset(30 * multiplierX)
            make.trailing.equalToSuperview().inset(248 * multiplierX)
    
        }
        
        sellButton.snp.makeConstraints { make in
            make.top.equalTo(chargeButton.snp.bottom).offset(41 * multiplierY)
            make.bottom.equalToSuperview().inset(250 * multiplierY)
            make.leading.equalTo(chargeButton)
            make.trailing.equalTo(chargeButton)
        }
        
        sellTextField.snp.makeConstraints { make in
            make.top.equalTo(sellButton)
            make.leading.equalTo(sellButton.snp.trailing).offset(37)
            make.trailing.equalTo(chargeLabel)
            make.bottom.equalTo(sellButton.snp.bottom)
        }
        
        equipButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(758 * multiplierY)
            make.leading.equalToSuperview().offset(30 * multiplierX)
            make.trailing.equalToSuperview().inset(30 * multiplierX)
        }
    }
}
