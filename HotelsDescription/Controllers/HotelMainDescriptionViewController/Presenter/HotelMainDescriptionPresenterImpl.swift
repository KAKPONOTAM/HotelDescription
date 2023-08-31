import UIKit

protocol HotelMainDescriptionPresenterProtocol: AnyObject {
    var hotelMainDescriptionModel: HotelDescriptionModel { get }
    var sections: [HotelDescriptionSections] { get }
    
    func configurePrice(for hotelDescriptionSections: HotelDescriptionSections) -> NSMutableAttributedString?
}

protocol HotelMainDescriptionViewProtocol: AnyObject {}

final class HotelMainDescriptionPresenterImplementation: HotelMainDescriptionPresenterProtocol {
    private let router: MainRouterProtocol
    private let viewModel: HotelMainDescriptionViewModelProtocol
    private weak var viewController: HotelMainDescriptionViewProtocol?
    
    var hotelMainDescriptionModel: HotelDescriptionModel
    
    var sections: [HotelDescriptionSections] {
        return HotelDescriptionSections.allCases
    }
    
    init(router: MainRouterProtocol, viewController: HotelMainDescriptionViewProtocol?, hotelMainDescriptionModel: HotelDescriptionModel, viewModel: HotelMainDescriptionViewModelProtocol) {
        self.router = router
        self.viewController = viewController
        self.hotelMainDescriptionModel = hotelMainDescriptionModel
        self.viewModel = viewModel
    }
    
    func configurePrice(for hotelDescriptionSections: HotelDescriptionSections) -> NSMutableAttributedString? {
        return viewModel.configurePrice(for: hotelDescriptionSections, hotelMainDescriptionModel: hotelMainDescriptionModel)
    }
}
