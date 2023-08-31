import Foundation
protocol HotelMainDescriptionPresenterProtocol: AnyObject {
    var hotelMainDescriptionModel: HotelDescriptionModel { get }
}

protocol HotelMainDescriptionViewProtocol: AnyObject {
    
}

final class HotelMainDescriptionPresenterImplementation: HotelMainDescriptionPresenterProtocol {
    private let router: MainRouterProtocol
    private weak var viewController: HotelMainDescriptionViewProtocol?
    
    var hotelMainDescriptionModel: HotelDescriptionModel
    
    init(router: MainRouterProtocol, viewController: HotelMainDescriptionViewProtocol?, hotelMainDescriptionModel: HotelDescriptionModel) {
        self.router = router
        self.viewController = viewController
        self.hotelMainDescriptionModel = hotelMainDescriptionModel
    }
}
