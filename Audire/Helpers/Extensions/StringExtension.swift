import Foundation

extension String {
    var containsNonEnglishNumbers: Bool {
        return !isEmpty && range(of: "[0-9]", options: .regularExpression) == nil
    }
    
    var english: String {
        return self.applyingTransform(StringTransform.toLatin, reverse: false) ?? self
    }
}
