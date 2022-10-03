//
//  NavigationBarView.swift
//  NavigationBarView
//
//  Created by Константин Хамицевич on 29.09.2022.
//

import Foundation
import UIKit
import SnapKit

class NavigationBarView: UIView {
    
    private let earphonesImage = UIImageView(image: UIImage(named: "earphones.png"))
    private let chargeStatusImage = UIImageView(image: UIImage(named: "chargeStatus.png"))
    private let firstTokenImage = UIImageView(image: UIImage(named: "token.png"))
    private let secondTokenImage = UIImageView(image: UIImage(named: "mainToken.png"))
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.customView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customView() {
        
        let screen = UIScreen.main.bounds
        let multiplierX = Double(screen.size.width / 428)
        let multiplierY = Double(screen.size.height / 926)
        
        //MARK: earphonesImage
        
        self.addSubview(earphonesImage)
        earphonesImage.contentMode = .scaleAspectFit
       
        earphonesImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30 * multiplierX)
            make.right.equalToSuperview().inset(338 * multiplierX)
            make.top.equalToSuperview().inset(0 * multiplierY)
            make.bottom.equalToSuperview().inset(61 * multiplierY)
        }
       
        //MARK: chargeStatusImage
        self.addSubview(chargeStatusImage)
        chargeStatusImage.contentMode = .scaleAspectFit
        
        chargeStatusImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(101.5 * multiplierX)
            make.right.equalToSuperview().inset(303.5 * multiplierX)
            make.top.equalToSuperview().inset(-5 * multiplierY)
            make.bottom.equalToSuperview().inset(55 * multiplierY)
        }
        
        //MARK: firstTokenImage
        
        self.addSubview(firstTokenImage)
        firstTokenImage.contentMode = .scaleAspectFit
        
        firstTokenImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(369 * multiplierX)
            make.right.equalToSuperview().inset(24 * multiplierX)
            make.top.equalToSuperview().inset(-5 * multiplierY)
            make.bottom.equalToSuperview().inset(91 * multiplierY)
        }
        
        //MARK: secondTokenImage
        
        self.addSubview(secondTokenImage)
        secondTokenImage.contentMode = .scaleAspectFit
        
        secondTokenImage.snp.makeConstraints { make in
            make.centerX.equalTo(firstTokenImage.snp.centerX)
            make.right.equalToSuperview().inset(22.5 * multiplierX)
            make.top.equalToSuperview().inset(26 * multiplierY)
            make.bottom.equalToSuperview().inset(55.5 * multiplierY)
        }
        
        //MARK: firstLabel
        
        self.addSubview(firstLabel)
        firstLabel.text = "0.27"
        firstLabel.textColor = .white
        firstLabel.font = UIFont(name: "Montserrat-Regular", size: 20)
        
       /* if screen.size.width < 380 {
            firstLabel.font = UIFont(name: "Montserrat-Light", size: 20)
        } else {
            firstLabel.font = UIFont(name: "Montserrat-Light", size: 20)
        }*/
        
        firstLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(317 * multiplierX).priority(.medium)
            make.right.equalToSuperview().inset(70 * multiplierX).priority(.high)
            make.top.equalToSuperview().inset(6 * multiplierY).priority(.medium)
            make.centerY.equalTo(secondTokenImage.snp.centerY)
        }
        
        //MARK: secondLabel
        
        self.addSubview(secondLabel)
        secondLabel.text = "1651.54"
        secondLabel.textColor = .white
        secondLabel.font = UIFont(name: "Montserrat-Regular", size: 20)
        
       /* if screen.size.width < 380 {
            secondLabel.font = UIFont(name: "Montserrat-Light", size: 20)
        } else {
            secondLabel.font = UIFont(name: "Montserrat-Light", size: 20)
        }*/
        
        secondLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(291 * multiplierX).priority(.medium)
            make.right.equalToSuperview().inset(70 * multiplierX).priority(.high)
            make.top.equalToSuperview().inset(44.5 * multiplierY).priority(.medium)
            make.centerY.equalTo(firstTokenImage.snp.centerY)
        }
        
    }
    
}
