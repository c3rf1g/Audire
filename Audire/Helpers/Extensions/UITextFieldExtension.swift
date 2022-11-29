import Foundation
import UIKit
// swiftlint:disable control_statement

extension UITextField {
    func addTargetForReplacingArabianNumbers() {
        self.addTarget(self, action: #selector(didChangeText(field:)), for: .editingChanged)
    }
    
    @objc func didChangeText(field: UITextField) {
        field.text = field.text?.replacingOccurrences(of: "٫", with: ".", options: .literal, range: nil)
        
        if ((field.text?.containsNonEnglishNumbers) != nil) {
            field.text = field.text?.english
        }
    }
}
