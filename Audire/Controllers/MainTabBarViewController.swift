import UIKit

final class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Resources.Colors.backgroundColor
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func  generateTabBar() {
        viewControllers = [
        generateVc(viewController: UINavigationController(rootViewController: AirPodsViewController()),
                   image: UIImage(systemName: "airpods")
                  ),
        generateVc(viewController: UINavigationController(rootViewController: MarketViewController()),
                   image: UIImage(systemName: "bag")
                  ),
        generateVc(viewController: UINavigationController(rootViewController: ProfileViewController()),
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
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = Resources.Colors.tabBarBackground
            UITabBar.appearance().standardAppearance = tabBarAppearance
        tabBar.backgroundColor = Resources.Colors.tabBarBackground
        
        tabBar.itemPositioning = .fill
    }
}
