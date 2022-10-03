import UIKit

final class MainTabBarViewController: UITabBarController {
    let customView = NavigationBarView()
    private let multiplier: Double = 121 / 926
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.view.backgroundColor = UIColor(red: 40/255, green: 24/255, blue: 61/255, alpha: 1)
        
        self.view.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).multipliedBy(multiplier)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
    }
    
    private func  generateTabBar() {
        viewControllers = [
        generateVc(viewController: AirPodsViewController(),
                   image: UIImage(systemName: "airpods")
                  ),
        generateVc(viewController: ShopViewController(),
                   image: UIImage(systemName: "bag")
                  ),
        generateVc(viewController: ProfileViewController(),
                   image: UIImage(systemName: "person.crop.circle")
                  )
        ]
    }
    
    private func generateVc(viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.tintColor = Resources.Colors.inactive
        let topline = CALayer()
        topline.frame = CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: 2)
        topline.backgroundColor = UIColor(hexString: "#EB00FF").cgColor
        self.tabBar.layer.addSublayer(topline)
        tabBar.backgroundColor = Resources.Colors.tabBarBackground
        
        tabBar.itemPositioning = .fill
    }
}


