import UIKit

struct ModuleBuilder {
    static func assemblyLaunchViewController() -> UIViewController? {
        let launchViewController = LaunchViewController()
        let presenter = LaunchViewPresenterImplementation()
        
        launchViewController.set(presenter: presenter)
        
        return launchViewController
    }
}
