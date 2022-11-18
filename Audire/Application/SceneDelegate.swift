import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if TestData.isUserLoggedAlready == true {
            window?.rootViewController =  MainTabBarViewController()
        } else {
            window?.rootViewController =  AuthorizationViewController()
        }
        window?.makeKeyAndVisible()
    }
}
