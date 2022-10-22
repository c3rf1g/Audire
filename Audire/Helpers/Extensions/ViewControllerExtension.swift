import UIKit
import SnapKit

extension UIViewController {
    func makeConstraintsForNavigationBarView(navBar: NavigationBarView) {
        navBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(61 * Resources.Multipliers.multiplierY)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(-44 * Resources.Multipliers.multiplierY)
            make.centerX.equalToSuperview()
        }
    }
    
    func createGradientLayer() {
        let newGradientLayer = CAGradientLayer()
        newGradientLayer.frame = self.view.bounds
        newGradientLayer.colors = [UIColor(hexString: "#28183D").cgColor, UIColor(hexString: "#130E22").cgColor]
        self.view.layer.addSublayer(newGradientLayer)
    }
}
