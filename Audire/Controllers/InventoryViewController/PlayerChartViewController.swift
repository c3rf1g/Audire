import UIKit
import SnapKit

enum IsPlay {
    case play
    case pause
}

final class PlayerChartViewController: UIViewController {
    
    var columnChart = ColumnChart()
    var isPlay = IsPlay.pause

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradientLayer()
        self.addingSubviews()
        self.setupConst()
        self.addingTargets()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func addingSubviews() {
        self.view.addSubview(columnChart)
    }
    
    private func setupConst() {
        columnChart.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func addingTargets() {
        self.columnChart.playButton.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    @objc func click() {
        
        switch isPlay {
        case .play:
            let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
            columnChart.playButton.setImage(UIImage(systemName: "play.fill", withConfiguration: config), for: .normal)
            isPlay = .pause
        case .pause:
            let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
            columnChart.playButton.setImage(UIImage(systemName: "pause.fill", withConfiguration: config), for: .normal)
            isPlay = .play
        }
        
        columnChart.delayOfCreateColumn(isPlay)
    }
    
}
