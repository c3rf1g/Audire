//
//  ProfileViewController.swift
//  Audire
//
//  Created by Константин Хамицевич on 09.10.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    let profile = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(profile)
            profile.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
}
