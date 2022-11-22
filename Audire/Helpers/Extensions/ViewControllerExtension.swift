import UIKit
import SnapKit

extension UIViewController {
    var largePresentControllerMultiplierY: Double {
        return Double(self.view.frame.height / 869)
    }
    
    var mediumPresentControllerMultiplierY: Double {
        return Double(self.view.frame.height / 501.67)
    }
    
    var anyPresentControllerMultiplierX: Double {
        return Double(self.view.frame.width / 428)
    }
    
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
    
    func createGradientLayerForLoginScreen() {
        let newGradientLayer = CAGradientLayer()
        newGradientLayer.frame = self.view.bounds
        newGradientLayer.colors = [UIColor(hexString: "#270C43").cgColor, UIColor(hexString: "#1E0737").cgColor]
        self.view.layer.addSublayer(newGradientLayer)
    }
    
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
