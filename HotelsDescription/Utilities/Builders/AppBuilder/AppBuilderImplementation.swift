import UIKit

protocol AppBuilderProtocol {
    mutating func createMainModule()
}

struct AppBuilderImplementation: AppBuilderProtocol {
    private var window: UIWindow?
    private let router = MainRouterImplementation()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    mutating func createMainModule() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = router.start()
        window?.makeKeyAndVisible()
    }
}
