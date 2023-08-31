import UIKit

protocol AppBuilderProtocol: AnyObject {
     func createMainModule()
}

final class AppBuilderImplementation: AppBuilderProtocol {
    private var window: UIWindow?
    private let router = MainRouterImplementation()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
     func createMainModule() {
        window?.rootViewController = router.start()
        window?.makeKeyAndVisible()
    }
}
