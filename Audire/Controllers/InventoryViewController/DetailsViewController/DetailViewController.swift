import Foundation
import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    private let inventoryView = DetailView()
    private let navBarView = NavigationBarView(withBackButton: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradientLayer()
        addViews()
        addingTargets()
        makeConstarints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func addViews() {
        view.addSubview(inventoryView)
        view.addSubview(navBarView)
    }
    
    private func makeConstarints() {
        inventoryView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        makeConstraintsForNavigationBarView(navBar: navBarView)
    }
    
    private func addingTargets() {
        navBarView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        view.frame.origin.y -= keyboardSize.height * 0.45
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    @objc private func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}
