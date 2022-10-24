import UIKit
import SnapKit

final class DetailView: UIView {
    
    private let headphoneNameLabel = CustomLabel(
        customText: "Pods",
        fontStyle: "Bold",
        fontSize: 24
    )
    
    private let backRectangle: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.backRectangle
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let headphoneImageView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.airpods
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
    
    private let tokenImageViewFirst: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.mainToken
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let tokenImageViewSecond: UIImageView = {
        let image = UIImageView()
        image.image = Resources.AppImages.mainToken
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
        radius: 10
    )
    
    private let sellButton = CustomButton(
        text: "Sell",
        fontStyle: "Bold",
        fontSize: 20,
        radius: 10
    )
    
    private let equipButton = CustomButton(
        text: "Equip",
        fontStyle: "Bold",
        fontSize: 20,
        radius: 10
    )
    
    let sellTextField = CustomTextField(
        startText: "00.00",
        fontStyle: "Bold",
        fontSize: 20,
        cornerRadius: 10,
        keyboard: .numbersWithPoint,
        withDoneButton: true
    )
    
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
            headphoneNameLabel, headphoneCode, headphoneTypeOfConnect,
            headphoneImageView, backRectangle, batteryImageView,
            batteryLabel, priceImageView, priceLabel, lightningImageView,
            lightningLabel, speakerImageView, speakerLabel,
            tokenImageViewFirst, tokenImageViewSecond,
            chargeLabel, equipButton, chargeButton, sellButton,
            sellTextField
        ]
        
        for item in items {
            addSubview(item)
        }
    }
    
    private func makeConstarints() {
        
        headphoneNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(143 * Resources.Multipliers.multiplierY)
            make.leading.equalToSuperview().offset(30 * Resources.Multipliers.multiplierX)
            make.trailing.equalToSuperview().inset(278 * Resources.Multipliers.multiplierX)
            make.bottom.equalToSuperview().inset(754 * Resources.Multipliers.multiplierY)
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
            make.height.equalTo(244 * Resources.Multipliers.multiplierY)
            make.width.equalTo(244 * Resources.Multipliers.multiplierX)
            make.top.equalTo(headphoneCode).offset(41 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(headphoneCode)
            
        }
        
        backRectangle.snp.makeConstraints { make in
            make.height.equalTo(40 * Resources.Multipliers.multiplierY)
            make.width.equalTo(4 * Resources.Multipliers.multiplierX)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10 * Resources.Multipliers.multiplierX)
        }
        
        batteryImageView.snp.makeConstraints { make in
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.top.equalTo(headphoneTypeOfConnect.snp.bottom).offset(80 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(headphoneImageView.snp.trailing).offset(36 * Resources.Multipliers.multiplierX)
        }
        
       batteryLabel.snp.makeConstraints { make in
            make.top.equalTo(batteryImageView)
            make.leading.equalTo(batteryImageView.snp.trailing).offset(13 * Resources.Multipliers.multiplierX)
           make.bottom.equalTo(batteryImageView)
        }
        
        lightningImageView.snp.makeConstraints { make in
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.top.equalTo(batteryImageView.snp.bottom).offset(15 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(batteryImageView)
        }
        
        lightningLabel.snp.makeConstraints { make in
            make.top.equalTo(lightningImageView)
            make.leading.equalTo(batteryLabel)
            make.bottom.equalTo(lightningImageView)
        }
        
        priceImageView.snp.makeConstraints { make in
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.top.equalTo(lightningImageView.snp.bottom).offset(15 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(lightningImageView)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceImageView)
            make.leading.equalTo(priceImageView.snp.trailing).offset(11 * Resources.Multipliers.multiplierX)
            make.bottom.equalTo(priceImageView)
        }
        
        speakerImageView.snp.makeConstraints { make in
            make.height.equalTo(35 * Resources.Multipliers.multiplierY)
            make.width.equalTo(35 * Resources.Multipliers.multiplierX)
            make.top.equalTo(priceImageView.snp.bottom).offset(15 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(priceImageView)
        }
        
        speakerLabel.snp.makeConstraints { make in
            make.top.equalTo(speakerImageView)
            make.leading.equalTo(priceLabel)
            make.bottom.equalTo(speakerImageView)
        }
        
        chargeButton.snp.makeConstraints { make in
            make.top.equalTo(headphoneImageView.snp.bottom).offset(43 * Resources.Multipliers.multiplierY)
            make.width.equalTo(150 * Resources.Multipliers.multiplierX)
            make.height.equalTo(41 * Resources.Multipliers.multiplierY)
            make.leading.equalToSuperview().offset(30 * Resources.Multipliers.multiplierX)
        }
        
        chargeLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(chargeButton)
            make.trailing.equalTo(chargeButton.snp.trailing).offset(156 * Resources.Multipliers.multiplierX)
            make.leading.equalTo(chargeButton.snp.trailing).offset(37 * Resources.Multipliers.multiplierX)
        }
        
        tokenImageViewFirst.snp.makeConstraints { make in
            make.height.equalTo(55 * Resources.Multipliers.multiplierY)
            make.width.equalTo(55 * Resources.Multipliers.multiplierX)
            make.top.equalTo(chargeLabel).offset(-8 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(chargeLabel.snp.trailing).offset(20 * Resources.Multipliers.multiplierX)
        }
        
        sellButton.snp.makeConstraints { make in
            make.top.equalTo(chargeButton.snp.bottom).offset(41 * Resources.Multipliers.multiplierY)
            make.width.equalTo(150 * Resources.Multipliers.multiplierX)
            make.height.equalTo(41 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(chargeButton)
        }
        
        sellTextField.snp.makeConstraints { make in
            make.top.bottom.equalTo(sellButton)
            make.leading.equalTo(sellButton.snp.trailing).offset(37 * Resources.Multipliers.multiplierX)
            make.trailing.equalTo(chargeLabel)
        }
        
        tokenImageViewSecond.snp.makeConstraints { make in
            make.height.equalTo(55 * Resources.Multipliers.multiplierY)
            make.width.equalTo(55 * Resources.Multipliers.multiplierX)
            make.top.equalTo(sellTextField).offset(-8 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(sellTextField.snp.trailing).offset(20 * Resources.Multipliers.multiplierX)
        }
        
        equipButton.snp.makeConstraints { make in
            make.top.equalTo(sellButton.snp.bottom).offset(82 * Resources.Multipliers.multiplierY)
            make.width.equalTo(368 * Resources.Multipliers.multiplierX)
            make.height.equalTo(41 * Resources.Multipliers.multiplierY)
            make.leading.equalTo(sellButton)
        }
    }
}
