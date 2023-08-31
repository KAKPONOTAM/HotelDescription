import Foundation
protocol HotelMainDescriptionPresenterProtocol: AnyObject {
    var hotelMainDescriptionModel: HotelDescriptionModel { get }
    var scrollConfigurationTuple: ScrollConfigurationTuple<HotelDescriptionSections.AllCases, HotelOfferRows.AllCases> { get } 
}

protocol HotelMainDescriptionViewProtocol: AnyObject {}

final class HotelMainDescriptionPresenterImplementation: HotelMainDescriptionPresenterProtocol {
    private let router: MainRouterProtocol
    private weak var viewController: HotelMainDescriptionViewProtocol?
    
    var hotelMainDescriptionModel: HotelDescriptionModel
    var scrollConfigurationTuple: ScrollConfigurationTuple<HotelDescriptionSections.AllCases, HotelOfferRows.AllCases> {
        return ScrollConfigurationTuple(HotelDescriptionSections.allCases, HotelOfferRows.allCases)
    }
    
    init(router: MainRouterProtocol, viewController: HotelMainDescriptionViewProtocol?, hotelMainDescriptionModel: HotelDescriptionModel) {
        self.router = router
        self.viewController = viewController
        self.hotelMainDescriptionModel = hotelMainDescriptionModel
    }
}
