//
//  FilteringViewController.swift
//  Audire
//
//  Created by Константин Хамицевич on 05.10.2022.
//

//TODO: Настроить текст филд(количество символов, расположение текста, таргеты, тип клавы), опрокинуть связи между слайдерами и текст филдами

import Foundation
import UIKit
import SnapKit

class FilteringViewController: UIViewController {
    
    private let ratingLabel = CustomLabel(customText: "Rating", fontStyle: "Regular", fontSize: 20)
    private let priceLabel = CustomLabel(customText: "Price", fontStyle: "Regular", fontSize: 20)
    private let releaseLabel = CustomLabel(customText: "Release", fontStyle: "Regular", fontSize: 20)
    private let powerLabel = CustomLabel(customText: "Power", fontStyle: "Regular", fontSize: 20)
    private let batteryLabel = CustomLabel(customText: "Battery", fontStyle: "Regular", fontSize: 20)
    private let volumeLabel = CustomLabel(customText: "Volume", fontStyle: "Regular", fontSize: 20)
    
    private let ratingSlider = CustomSlider(
        minValue: 1,
        maxValue: 100,
        color: Resources.Colors.ratingSliderColor
    )
    private let priceSlider = CustomSlider(
        minValue: 1,
        maxValue: 100,
        color: Resources.Colors.priceSliderColor
    )
    private let releaseSlider = CustomSlider(
        minValue: 1,
        maxValue: 100,
        color: Resources.Colors.releaseSliderColor
    )
    private let powerSlider = CustomSlider(
        minValue: 1,
        maxValue: 100,
        color: Resources.Colors.powerSliderColor
    )
    private let batterySlider = CustomSlider(
        minValue: 1,
        maxValue: 100,
        color: Resources.Colors.batterySliderColor
    )
    private let volumeSlider = CustomSlider(
        minValue: 1,
        maxValue: 100,
        color: Resources.Colors.volumeSliderColor
    )
    
    private let ratingMax = CustomTextField(startText: "100", fontStyle: "Regular", fontSize: 20)
    private let ratingMin = CustomTextField(startText: "1", fontStyle: "Regular", fontSize: 20)
    
    private let priceMax = CustomTextField(startText: "100", fontStyle: "Regular", fontSize: 20)
    private let priceMin = CustomTextField(startText: "1", fontStyle: "Regular", fontSize: 20)
    
    private let releaseMax = CustomTextField(startText: "100", fontStyle: "Regular", fontSize: 20)
    private let releaseMin = CustomTextField(startText: "1", fontStyle: "Regular", fontSize: 20)
    
    private let powerMax = CustomTextField(startText: "100", fontStyle: "Regular", fontSize: 20)
    private let powerMin = CustomTextField(startText: "1", fontStyle: "Regular", fontSize: 20)
    
    private let batteryMax = CustomTextField(startText: "100", fontStyle: "Regular", fontSize: 20)
    private let batteryMin = CustomTextField(startText: "1", fontStyle: "Regular", fontSize: 20)
    
    private let volumeMax = CustomTextField(startText: "100", fontStyle: "Regular", fontSize: 20)
    private let volumeMin = CustomTextField(startText: "1", fontStyle: "Regular", fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.addingSubviews()
        self.addingTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupConst()
    }
    
    private func setupUI() {
        self.view.backgroundColor = Resources.Colors.inactiveButtonColor
    }
    
    private func addingSubviews() {
        let allElements = [
            ratingLabel, priceLabel, releaseLabel, powerLabel, batteryLabel, volumeLabel,
            ratingSlider, priceSlider, releaseSlider, powerSlider, batterySlider, volumeSlider,
            ratingMax, priceMax, releaseMax, powerMax, batteryMax, volumeMax,
            ratingMin, priceMin, releaseMin, powerMin, batteryMin, volumeMin
        ]
        
        for element in allElements {
            self.view.addSubview(element)
        }
    }
    
    private func addingTargets() {
        let slidersArray = [
            ratingSlider, priceSlider, releaseSlider,
            powerSlider, batterySlider, volumeSlider
        ]
        let maxArray = [
            ratingMax, priceMax, releaseMax,
            powerMax, batteryMax, volumeMax
        ]
        
        for slider in slidersArray {
            slider.addTarget(self, action: #selector(sliderValueDidChanged), for: .valueChanged)
        }
        for element in maxArray{
            element.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
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
        
        //MARK: Эти мультиплаеры только для этого контроллера(половина экрана)
        let multiplierX = Double(self.view.frame.width / 428)
        let multiplierY = Double(self.view.frame.height / 501.6666666666667)
       
        //MARK: Consts for labels
        ratingLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.right.equalToSuperview().inset(268 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(24.8 * multiplierY)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.right.equalToSuperview().inset(284 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(100.8 * multiplierY)
        }
        
        releaseLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.right.equalToSuperview().inset(257 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(176.8 * multiplierY)
        }
        
        powerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.right.equalToSuperview().inset(271 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(252.8 * multiplierY)
        }
        
        batteryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.right.equalToSuperview().inset(261 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(330.8 * multiplierY)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(92 * multiplierX).priority(.high)
            make.right.equalToSuperview().inset(257 * multiplierX).priority(.medium)
            make.top.equalToSuperview().inset(406.8 * multiplierY)
        }
        
        //MARK: Consts for sliders
        for i in 0..<labelsArray.count{
            slidersArray[i].snp.makeConstraints { make in
                make.height.equalTo(20 * multiplierY)
                make.left.equalToSuperview().inset(92 * multiplierX)
                make.right.equalToSuperview().inset(92 * multiplierX)
                make.top.equalTo(labelsArray[i].snp.bottom).offset(16 * multiplierY)
            }
        }
        
        //MARK: Min Max fields
        for i in 0..<labelsArray.count {
            maxArray[i].snp.makeConstraints { make in
                make.left.equalToSuperview().inset(279 * multiplierX)
                make.right.equalToSuperview().inset(92 * multiplierX)
                make.centerY.equalTo(labelsArray[i].snp.centerY)
                make.height.equalTo(24 * multiplierY)
            }
            
            minArray[i].snp.makeConstraints { make in
                make.left.equalToSuperview().inset(217 * multiplierX)
                make.right.equalToSuperview().inset(153 * multiplierX)
                make.centerY.equalTo(labelsArray[i].snp.centerY)
                make.height.equalTo(24 * multiplierY)
            }
        }
    }
    
    @objc private func sliderValueDidChanged(slider: CustomSlider) {
        let newValue = slider.value
        
        switch slider {
        case ratingSlider:
            ratingMax.text = String(Int(slider.value))
            slider.value = {
                return Float(Int(newValue))
            }()
        case priceSlider:
            priceMax.text = String(Int(slider.value))
            slider.value = {
                return Float(Int(newValue))
            }()
        case releaseSlider:
            releaseMax.text = String(Int(slider.value))
            slider.value = {
                return Float(Int(newValue))
            }()
        case powerSlider:
            powerMax.text = String(Int(slider.value))
            slider.value = {
                return Float(Int(newValue))
            }()
        case batterySlider:
            batteryMax.text = String(Int(slider.value))
            slider.value = {
                return Float(Int(newValue))
            }()
        case volumeSlider:
            volumeMax.text = String(Int(slider.value))
            slider.value = {
                return Float(Int(newValue))
            }()
        default: print("Error")
        }
        
    }

    @objc private func textFieldDidChange(textField: CustomTextField) {
        if let stringValue = textField.text {
            if let floatValue = Float(stringValue) {
                var slider = ratingSlider
                
                switch textField {
                case ratingMax:
                    slider = ratingSlider
                case priceMax:
                    slider = priceSlider
                case releaseMax:
                    slider = releaseSlider
                case powerMax:
                    slider = powerSlider
                case batteryMax:
                    slider = batterySlider
                case volumeSlider:
                    slider = volumeSlider
                default: print("Error")
                }
                
                slider.setValue(floatValue, animated: true)
            }
        }
    }
}

