import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    private let inventoryView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppereance()
        addViews()
        makeConstarints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupAppereance() {
        MethodsUI().createGradientLayer(vc: self)
    }
    
    private func addViews() {
        view.addSubview(inventoryView)
    }
    
    private func makeConstarints() {
        inventoryView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        inventoryView.frame.origin.y -= keyboardSize.height * 0.4
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
        inventoryView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
}
