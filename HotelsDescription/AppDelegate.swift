import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var appBuilder: AppBuilderProtocol?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appBuilder = AppBuilderImplementation(window: window)
        appBuilder?.createMainModule()
        
        return true
    }
}

