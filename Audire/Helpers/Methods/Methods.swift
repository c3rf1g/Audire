import UIKit
import SnapKit

struct Methods {
    // MARK: Проверка на дурака вводимых значений в MinMaxTextFields в FilteringViewController
    public func editingInputValuesOfTextFields(textField: UITextField) {
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
    
    // MARK: Анимация перехода viewController'ов и презентация viewController с определенным стилем
    public enum DirectionForAnimation {
        case fromLeft
        case fromRight
    }
    
    public func settingAnimation(direction: DirectionForAnimation, usingView: UIView) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        switch direction {
        case .fromLeft:
            transition.subtype = CATransitionSubtype.fromLeft
        case .fromRight:
            transition.subtype = CATransitionSubtype.fromRight
        }
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        usingView.window?.layer.add(transition, forKey: kCATransition)
    }
    
    public func presentViewController(newVC: UIViewController, oldVC: UIViewController, withStyle: UIModalPresentationStyle) {
        newVC.modalPresentationStyle = withStyle
        oldVC.present(newVC, animated: false, completion: nil)
    }
    
    // MARK: Выставить констреинты для верхней вьюшки. Принимает саму вюшку и контроллер, к которому вяжем
    public func makeConstraintsForNavigationBarView(navBar: NavigationBarView, addingToViewController: UIViewController) {
        navBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(61 * Resources.Multipliers.multiplierY)
            make.top.equalTo(addingToViewController.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
    }
}
