import Foundation
import UIKit

class ShopViewController: UIViewController {
    let sortingButton = CustomButton(text: "Sort by", fontStyle: "Regular", fontSize: 20)
    let filteringButton = CustomButton(text: "Filters", fontStyle: "Regular", fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    
    private func setupUI() {
        
        let screen = UIScreen.main.bounds
        let multiplierX = Double(screen.size.width / 428)
        let multiplierY = Double(screen.size.height / 926)
        
        self.view.backgroundColor = UIColor(red: 40/255, green: 24/255, blue: 61/255, alpha: 1)
        
        self.view.addSubview(sortingButton)
        sortingButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30 * multiplierX)
            make.top.equalToSuperview().inset(195 * multiplierY)
            make.right.equalToSuperview().inset(225 * multiplierX)
            make.bottom.equalToSuperview().inset(701 * multiplierY)
        }
        
        self.view.addSubview(filteringButton)
        filteringButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(225 * multiplierX)
            make.top.equalToSuperview().inset(195 * multiplierY)
            make.right.equalToSuperview().inset(30 * multiplierX)
            make.bottom.equalToSuperview().inset(701 * multiplierY)
        }
        
        sortingButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        let actionSheet = UIAlertController(title: "Sorting", message: nil, preferredStyle: .actionSheet)
        
        
        actionSheet.addAction(UIAlertAction(title: "Max price", style: .default, handler: { _ in
    
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Rating", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Release date", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Volume", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Power", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Battery", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Min price", style: .default, handler: { _ in
           
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
