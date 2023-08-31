import UIKit

protocol MainRouterProtocol {
    func start() -> UIViewController?
}

final class MainRouterImplementation: MainRouterProtocol {
    private var viewController: UIViewController? = ModuleBuilder.assemblyLaunchViewController()
    
    func start() -> UIViewController? {
        return viewController
    }
}
