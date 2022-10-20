import Foundation
import UIKit
import SnapKit

class AirPodsViewController: UIViewController {
    
    weak var collectionView: UICollectionView!
    private let multiplierX = Double(UIScreen.main.bounds.size.width / 428)
    private let multiplierY = Double(UIScreen.main.bounds.size.height / 926)
    
    override func loadView() {
        super.loadView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(collectionView)
        
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(AirPodsCollectionViewCell.self, forCellWithReuseIdentifier: AirPodsCollectionViewCell.identifier)
        makeConstraints()
    }
    
}

extension AirPodsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AirPodsCollectionViewCell.identifier, for: indexPath) as! AirPodsCollectionViewCell // swiftlint:disable:this force_cast
        return cell
    }
}

extension AirPodsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension AirPodsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 368 * multiplierX, height: 164 * multiplierY)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 41 * multiplierY
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)

    }
    
    private func makeConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(121 * multiplierY)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
