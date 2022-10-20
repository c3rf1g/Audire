import Foundation
import UIKit

struct MethodsUI {

    func createGradientLayer(vc: UIViewController) {
        
        let newGradientLayer = CAGradientLayer()
        newGradientLayer.frame = vc.view.bounds
        newGradientLayer.colors = [UIColor(hexString: "#28183D").cgColor, UIColor(hexString: "#130E22").cgColor]
        vc.view.layer.addSublayer(newGradientLayer)
    }
}
