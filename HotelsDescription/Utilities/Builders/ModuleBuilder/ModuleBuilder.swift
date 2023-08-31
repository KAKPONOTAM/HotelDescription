import UIKit

struct ModuleBuilder {
    static func assemblyLaunchViewController(router: HandlingRouter) -> UIViewController {
        let launchViewController = LaunchViewController()
        let networkManager = NetworkManagerImplementation()
        let presenter = LaunchViewPresenterImplementation(
            viewController: launchViewController,
            networkManager: networkManager,
            router: router)
        
        launchViewController.set(presenter: presenter)
        
        return launchViewController
    }
    
    static func assemblyHotelMainDescriptionViewController(router: MainRouterProtocol, hotelDescriptionModel: HotelDescriptionModel) -> UIViewController {
        let hotelMainDescriptionViewController = HotelMainDescriptionViewController()
        let viewModel = HotelMainDescriptionViewModelImplementation()
        let presenter = HotelMainDescriptionPresenterImplementation(
            router: router,
            viewController: hotelMainDescriptionViewController,
            hotelMainDescriptionModel: hotelDescriptionModel,
            viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: hotelMainDescriptionViewController)
        
        hotelMainDescriptionViewController.set(presenter: presenter)
        
        return navigationController
        
    }
}
