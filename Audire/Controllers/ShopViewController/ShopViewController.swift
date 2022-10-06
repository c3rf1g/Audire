import Foundation
import UIKit
import SnapKit

class ShopViewController: UIViewController {
    
    private let sortingButton = CustomButton(text: "Sort by", fontStyle: "Regular", fontSize: 20)
    private let filteringButton = CustomButton(text: "Filters", fontStyle: "Regular", fontSize: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
    }
    
    private func setupUI() {
        self.view.backgroundColor = Resources.Colors.backgroundColor
    }
    
    private func addingSubviews() {
        self.view.addSubview(sortingButton)
        self.view.addSubview(filteringButton)
    }
    
    private func setupConst() {
        sortingButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(195 * Resources.Multipliers.multiplierY)
            make.right.equalToSuperview().inset(225 * Resources.Multipliers.multiplierX)
            make.bottom.equalToSuperview().inset(701 * Resources.Multipliers.multiplierY)
        }
        
        filteringButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(225 * Resources.Multipliers.multiplierX)
            make.top.equalToSuperview().inset(195 * Resources.Multipliers.multiplierY)
            make.right.equalToSuperview().inset(30 * Resources.Multipliers.multiplierX)
            make.bottom.equalToSuperview().inset(701 * Resources.Multipliers.multiplierY)
        }
    }
    
    private func addingTargets() {
        sortingButton.addTarget(self, action: #selector(sortingButtonPressed), for: .touchUpInside)
        filteringButton.addTarget(self, action: #selector(filteringButtonPressed), for: .touchUpInside)
    }
    
    @objc private func sortingButtonPressed() {
        let actionSheet = UIAlertController(title: "Sorting", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.view.tintColor = Resources.Colors.sortingButtonActionSheetTextColor

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
    
    @objc private func filteringButtonPressed() {
        let vc = FilteringViewController()
        
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        self.present(vc, animated: true)
    }
    
}
