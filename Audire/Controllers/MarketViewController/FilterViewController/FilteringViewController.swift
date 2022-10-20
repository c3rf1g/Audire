import UIKit
import SnapKit
// swiftlint:disable cyclomatic_complexity
// swiftlint:disable type_body_length
// swiftlint:disable file_length
final class FilteringViewController: UIViewController {
    private let ratingLabel = CustomLabel(customText: "Rating", fontStyle: "Regular", fontSize: 20)
    private let priceLabel = CustomLabel(customText: "Price", fontStyle: "Regular", fontSize: 20)
    private let releaseLabel = CustomLabel(customText: "Release", fontStyle: "Regular", fontSize: 20)
    private let powerLabel = CustomLabel(customText: "Power", fontStyle: "Regular", fontSize: 20)
    private let batteryLabel = CustomLabel(customText: "Battery", fontStyle: "Regular", fontSize: 20)
    private let volumeLabel = CustomLabel(customText: "Volume", fontStyle: "Regular", fontSize: 20)
    
    private let ratingSlider = CustomSlider(
        minimumValue: 1,
        maximumValue: 100,
        mainColor: Resources.Colors.ratingSliderColor,
        borderShadowColor: Resources.Colors.ratingSliderShadowColor
    )
    private let priceSlider = CustomSlider(
        minimumValue: 1,
        maximumValue: 100,
        mainColor: Resources.Colors.priceSliderColor,
        borderShadowColor: Resources.Colors.priceSliderShadowColor
    )
    private let releaseSlider = CustomSlider(
        minimumValue: 1,
        maximumValue: 100,
        mainColor: Resources.Colors.releaseSliderColor,
        borderShadowColor: Resources.Colors.releaseSliderShadowColor
    )
    private let powerSlider = CustomSlider(
        minimumValue: 1,
        maximumValue: 100,
        mainColor: Resources.Colors.powerSliderColor,
        borderShadowColor: Resources.Colors.powerSliderShadowColor
    )
    private let batterySlider = CustomSlider(
        minimumValue: 1,
        maximumValue: 100,
        mainColor: Resources.Colors.batterySliderColor,
        borderShadowColor: Resources.Colors.batterySliderShadowColor
    )
    private let volumeSlider = CustomSlider(
        minimumValue: 1,
        maximumValue: 100,
        mainColor: Resources.Colors.volumeSliderColor,
        borderShadowColor: Resources.Colors.volumeSliderShadowColor
    )
    private let ratingMax = CustomTextField(
        startText: "100",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let ratingMin = CustomTextField(
        startText: "1",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let priceMax = CustomTextField(
        startText: "100",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let priceMin = CustomTextField(
        startText: "1",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let releaseMax = CustomTextField(
        startText: "100",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let releaseMin = CustomTextField(
        startText: "1",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let powerMax = CustomTextField(
        startText: "100",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let powerMin = CustomTextField(
        startText: "1",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let batteryMax = CustomTextField(
        startText: "100",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let batteryMin = CustomTextField(
        startText: "1",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let volumeMax = CustomTextField(
        startText: "100",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    private let volumeMin = CustomTextField(
        startText: "1",
        fontStyle: "Regular",
        fontSize: 20,
        cornerRadius: 5
    )
    
    private let applyButton = CustomButton(
        text: "Apply",
        fontStyle: "Regular",
        fontSize: 16,
        radius: 5
    )
    private let resetButton = CustomButton(
        text: "Reset",
        fontStyle: "Regular",
        fontSize: 16,
        radius: 5
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.addingSubviews()
        self.setupDelegatesAndTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupConst()
    }
    
    private func setupUI() {
        self.view.backgroundColor = Resources.Colors.backgroundColor
    }
    
    private func addingSubviews() {
        let allElements = [
            ratingLabel, priceLabel, releaseLabel, powerLabel, batteryLabel, volumeLabel,
            ratingSlider, priceSlider, releaseSlider, powerSlider, batterySlider, volumeSlider,
            ratingMax, priceMax, releaseMax, powerMax, batteryMax, volumeMax,
            ratingMin, priceMin, releaseMin, powerMin, batteryMin, volumeMin, applyButton, resetButton
        ]
        
        for element in allElements {
            self.view.addSubview(element)
        }
    }
    
    private func setupDelegatesAndTargets() {
        let slidersArray = [
            ratingSlider, priceSlider, releaseSlider,
            powerSlider, batterySlider, volumeSlider
        ]
        
        let minMaxArray = [
            ratingMax, priceMax, releaseMax,
            powerMax, batteryMax, volumeMax,
            ratingMin, priceMin, releaseMin,
            powerMin, batteryMin, volumeMin
        ]
        
        for element in minMaxArray {
            element.delegate = self
        }
        for slider in slidersArray {
            slider.delegate = self
        }
        
        applyButton.addTarget(self, action: #selector(applyButtonPressed), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
    }
    
    private func setupConst() {
        let labelsArray = [
            ratingLabel, priceLabel, releaseLabel,
            powerLabel, batteryLabel, volumeLabel
        ]
        let slidersArray = [
            ratingSlider, priceSlider, releaseSlider,
            powerSlider, batterySlider, volumeSlider
        ]
        let minArray = [
            ratingMin, priceMin, releaseMin,
            powerMin, batteryMin, volumeMin
        ]
        let maxArray = [
            ratingMax, priceMax, releaseMax,
            powerMax, batteryMax, volumeMax
        ]
        
        // MARK: Эти мультиплаеры только для этого контроллера(половина экрана)
        let multiplierX = Double(self.view.frame.width / 428)
        let multiplierY = Double(self.view.frame.height / 869.0)
        
        // MARK: Consts for labels
        ratingLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(268 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(54 * multiplierY)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(284 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(136 * multiplierY)
        }
        
        releaseLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(257 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(218 * multiplierY)
        }
        
        powerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(271 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(300 * multiplierY)
        }
        
        batteryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(261 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(382 * multiplierY)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.trailing.equalToSuperview().inset(257 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(464 * multiplierY)
        }
        
        // MARK: Consts for sliders
        for index in 0..<labelsArray.count {
            slidersArray[index].snp.makeConstraints { make in
                make.height.equalTo(20 * multiplierY)
                make.leading.equalToSuperview().inset(92 * multiplierX)
                make.trailing.equalToSuperview().inset(92 * multiplierX)
                make.top.equalTo(labelsArray[index].snp.bottom).offset(14 * multiplierY)
            }
            slidersArray[index].lineHeight = 20 * multiplierY
        }
        
        // MARK: Min Max fields const
        for index in 0..<labelsArray.count {
            maxArray[index].snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(279 * multiplierX)
                make.trailing.equalToSuperview().inset(92 * multiplierX)
                make.centerY.equalTo(labelsArray[index].snp.centerY)
                make.height.equalTo(24 * multiplierY)
            }
            
            minArray[index].snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(217 * multiplierX)
                make.trailing.equalToSuperview().inset(153 * multiplierX)
                make.centerY.equalTo(labelsArray[index].snp.centerY)
                make.height.equalTo(24 * multiplierY)
            }
        }
        
        // MARK: buttons const
        resetButton.snp.makeConstraints { make in
            make.height.equalTo(20 * multiplierY)
            make.leading.equalToSuperview().inset(229 * multiplierX)
            make.trailing.equalToSuperview().inset(92 * multiplierX)
            make.top.equalTo(volumeSlider.snp.bottom).offset(48 * multiplierY)
        }
        
        applyButton.snp.makeConstraints { make in
            make.height.equalTo(20 * multiplierY)
            make.leading.equalToSuperview().inset(92 * multiplierX)
            make.trailing.equalToSuperview().inset(229 * multiplierX)
            make.top.equalTo(volumeSlider.snp.bottom).offset(48 * multiplierY)
        }
    }
    
    @objc private func applyButtonPressed() {
        // MARK: Записать данные сортировки
        self.dismiss(animated: true)
    }
    
    @objc private func resetButtonPressed() {
        let slidersArray = [
            ratingSlider, priceSlider, releaseSlider,
            powerSlider, batterySlider, volumeSlider
        ]
        let minMaxArray = [
            ratingMax, priceMax, releaseMax,
            powerMax, batteryMax, volumeMax,
            ratingMin, priceMin, releaseMin,
            powerMin, batteryMin, volumeMin
        ]
        
        for element in minMaxArray {
            element.text = nil
            element.layer.borderColor = Resources.Colors.activeButtonTextColor.cgColor
        }
        
        for slider in slidersArray {
            slider.selectedMinValue = 1
            slider.selectedMaxValue = 100
            slider.updateHandlePositions()
        }
    }
    
    private func editingInputValuesOfTextFields(textField: UITextField) {
        var temp = textField.text ?? ""
        var tempArray: [Character?] = []
        
        for element in temp {
            tempArray.append(element)
        }
        
        switch tempArray.count {
        case 0:
            tempArray.append(contentsOf: [nil, nil, nil])
        case 1:
            tempArray.append(contentsOf: [nil, nil])
        case 2:
            tempArray.append(contentsOf: [nil])
            
        default: break
        }
        
        if  (tempArray[0] == "0" && tempArray[1] == nil && tempArray[2] == nil) ||
            (tempArray[0] == "0" && tempArray[1] == "0" && tempArray[2] == nil) ||
            (tempArray[0] == "0" && tempArray[1] == "0" && tempArray[2] == "0") {           // 0
            temp = "1"
        } else if tempArray[0] == "0" && tempArray[1] == "0" && tempArray[2] != "0" {       // 001
            temp.removeFirst()
            temp.removeFirst()
        } else if tempArray[0] == "0" && tempArray[1] != "0" {                              // 010 025 01 02
            temp.removeFirst()
        } else if (Int(temp) ?? 0) > 100 {                                                  // >100
            temp = "100"
        }
        
        textField.text = temp
    }
}

extension FilteringViewController: RangeSeekSliderDelegate {
    // MARK: Изменение текста в зависимости от положение ползунков
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        switch slider {
        case ratingSlider:
            ratingMax.text = String(Int(slider.selectedMaxValue))
            ratingMax.layer.borderColor = UIColor.white.cgColor
            ratingMin.text = String(Int(slider.selectedMinValue))
            ratingMin.layer.borderColor = UIColor.white.cgColor
        case priceSlider:
            priceMax.text = String(Int(slider.selectedMaxValue))
            priceMax.layer.borderColor = UIColor.white.cgColor
            priceMin.text = String(Int(slider.selectedMinValue))
            priceMin.layer.borderColor = UIColor.white.cgColor
        case releaseSlider:
            releaseMax.text = String(Int(slider.selectedMaxValue))
            releaseMax.layer.borderColor = UIColor.white.cgColor
            releaseMin.text = String(Int(slider.selectedMinValue))
            releaseMin.layer.borderColor = UIColor.white.cgColor
        case powerSlider:
            powerMax.text = String(Int(slider.selectedMaxValue))
            powerMax.layer.borderColor = UIColor.white.cgColor
            powerMin.text = String(Int(slider.selectedMinValue))
            powerMin.layer.borderColor = UIColor.white.cgColor
        case batterySlider:
            batteryMax.text = String(Int(slider.selectedMaxValue))
            batteryMax.layer.borderColor = UIColor.white.cgColor
            batteryMin.text = String(Int(slider.selectedMinValue))
            batteryMin.layer.borderColor = UIColor.white.cgColor
        case volumeSlider:
            volumeMax.text = String(Int(slider.selectedMaxValue))
            volumeMax.layer.borderColor = UIColor.white.cgColor
            volumeMin.text = String(Int(slider.selectedMinValue))
            volumeMin.layer.borderColor = UIColor.white.cgColor
        default: print("Error")
        }
    }
}

extension FilteringViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingInputValuesOfTextFields(textField: textField)
        
        // MARK: Изменение положения ползунков в зависимости от текста
        let slidersArray = [
            ratingSlider, priceSlider, releaseSlider,
            powerSlider, batterySlider, volumeSlider
        ]
        
        if let stringValue = textField.text {        // Для случая, если значение изменилось на число
            if let floatValue = Float(stringValue) {
                switch textField {
                case ratingMax:
                    ratingSlider.selectedMaxValue = CGFloat(floatValue)
                case ratingMin:
                    ratingSlider.selectedMinValue = CGFloat(floatValue)
                case priceMax:
                    priceSlider.selectedMaxValue = CGFloat(floatValue)
                case priceMin:
                    priceSlider.selectedMinValue = CGFloat(floatValue)
                case releaseMax:
                    releaseSlider.selectedMaxValue = CGFloat(floatValue)
                case releaseMin:
                    releaseSlider.selectedMinValue = CGFloat(floatValue)
                case powerMax:
                    powerSlider.selectedMaxValue = CGFloat(floatValue)
                case powerMin:
                    powerSlider.selectedMinValue = CGFloat(floatValue)
                case batteryMax:
                    batterySlider.selectedMaxValue = CGFloat(floatValue)
                case batteryMin:
                    batterySlider.selectedMinValue = CGFloat(floatValue)
                case volumeMax:
                    volumeSlider.selectedMaxValue = CGFloat(floatValue)
                case volumeMin:
                    volumeSlider.selectedMinValue = CGFloat(floatValue)
                
                default: break
                }
                
                for slider in slidersArray {
                    slider.updateHandlePositions()
                }
                
            } else {
                switch textField {              // Для случая, если значение скинулось на дефолтное
                case ratingMax:
                    ratingSlider.selectedMaxValue = 100
                case ratingMin:
                    ratingSlider.selectedMinValue = 1
                case priceMax:
                    priceSlider.selectedMaxValue = 100
                case priceMin:
                    priceSlider.selectedMinValue = 1
                case releaseMax:
                    releaseSlider.selectedMaxValue = 100
                case releaseMin:
                    releaseSlider.selectedMinValue = 1
                case powerMax:
                    powerSlider.selectedMaxValue = 100
                case powerMin:
                    powerSlider.selectedMinValue = 1
                case batteryMax:
                    batterySlider.selectedMaxValue = 100
                case batteryMin:
                    batterySlider.selectedMinValue = 1
                case volumeMax:
                    volumeSlider.selectedMaxValue = 100
                case volumeMin:
                    volumeSlider.selectedMinValue = 1
                
                default: break
                }
                
                for slider in slidersArray {
                    slider.updateHandlePositions()
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // MARK: Ограничение вводимого текста 3 символами
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 3
    }
}
