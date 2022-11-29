import UIKit

final class CustomActionSheet: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.addingActions()
    }
    
    private func setupUI() {
        self.view.tintColor = Resources.Colors.sortingButtonActionSheetTextColor
    }
    
    private func addingActions() {
        self.addAction(UIAlertAction(title: "Max price", style: .default, handler: { _ in
    
        }))
        self.addAction(UIAlertAction(title: "Rating", style: .default, handler: { _ in
            
        }))
        self.addAction(UIAlertAction(title: "Release date", style: .default, handler: { _ in
            
        }))
        self.addAction(UIAlertAction(title: "Volume", style: .default, handler: { _ in
            
        }))
        self.addAction(UIAlertAction(title: "Power", style: .default, handler: { _ in
            
        }))
        self.addAction(UIAlertAction(title: "Battery", style: .default, handler: { _ in
            
        }))
        self.addAction(UIAlertAction(title: "Min price", style: .default, handler: { _ in
           
        }))
        self.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
}
