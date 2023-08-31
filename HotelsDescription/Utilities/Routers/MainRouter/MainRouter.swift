import UIKit

protocol MainRouterProtocol {
    func start() -> UIViewController?
    func changeMainModule(hotelDescriptionModel: HotelDescriptionModel)
}

protocol MainRouterErrorHandlingProtocol: AnyObject {
    func handleError(title: String?, message: String?)
}

final class MainRouterImplementation: MainRouterProtocol {
    private lazy var viewController: UIViewController? = ModuleBuilder.assemblyLaunchViewController(router: self)
    
    func start() -> UIViewController? {
        return viewController
    }
    
    func changeMainModule(hotelDescriptionModel: HotelDescriptionModel) {
        viewController = ModuleBuilder.assemblyHotelMainDescriptionViewController(router: self, hotelDescriptionModel: hotelDescriptionModel)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else { return }
        
        appDelegate.appBuilder?.createMainModule()
        
        UIView.transition(
            with: window, duration: 0.5,
            options: .transitionCrossDissolve,
            animations: .none,
            completion: .none)
    }
}

extension MainRouterImplementation: MainRouterErrorHandlingProtocol {
    func handleError(title: String?, message: String?) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okAction)
        
        viewController?.present(alertController, animated: true)
    }
}
