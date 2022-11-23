import Foundation
import UIKit
import SnapKit

final class InventoryViewController: UIViewController {
    
    weak var collectionView: UICollectionView!
    private let navBarView = NavigationBarView(withBackButton: false)
    
    override func loadView() {
        super.loadView()
        
        createGradientLayer()
        addingSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(InventoryCollectionViewCell.self, forCellWithReuseIdentifier: InventoryCollectionViewCell.identifier)
        makeConstraints()
    }
    
}

extension InventoryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InventoryCollectionViewCell.identifier, for: indexPath) as! InventoryCollectionViewCell // swiftlint:disable:this force_cast
        return cell
    }
}

extension InventoryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = InventoryDetailViewController()
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension InventoryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 368 * Resources.Multipliers.multiplierX, height: 164 * Resources.Multipliers.multiplierY)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 41 * Resources.Multipliers.multiplierY
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)

    }
    
    private func makeConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(121 * Resources.Multipliers.multiplierY)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        makeConstraintsForNavigationBarView(navBar: navBarView)
    }
    
    private func addingSubviews() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        self.navigationController?.navigationBar.removeFromSuperview()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.view.addSubview(collectionView)
        self.view.addSubview(navBarView)
        self.collectionView = collectionView
    }
}
