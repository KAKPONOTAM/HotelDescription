import UIKit

protocol HotelMainDescriptionPresenterProtocol: AnyObject {
    var hotelMainDescriptionModel: HotelDescriptionModel { get }
    var scrollConfigurationTuple: ScrollConfigurationTuple<HotelDescriptionSections.AllCases, HotelOfferRows.AllCases> { get }
    
    func configurePrice(for hotelDescriptionSections: HotelDescriptionSections) -> NSMutableAttributedString?
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
    
    func configurePrice(for hotelDescriptionSections: HotelDescriptionSections) -> NSMutableAttributedString? {
        switch hotelDescriptionSections {
        case .hotelName:
            let attributedString = NSMutableAttributedString(
                string: "Steigenberger Makadi",
                attributes: [.font: UIFont.boldSystemFont(ofSize: 22), .foregroundColor: UIColor.black]) // hard code cuz no data in API
            
          return attributedString
            
        case .hotelAddress:
            let attributedString = NSMutableAttributedString(
                string: hotelMainDescriptionModel.decodableHotelMainDescriptionModel.adress,
                attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.blue])
            
            return attributedString
            
        case .tourPrice:
            let numberFormatter = NumberFormatter()
            let price = NSNumber(value: UInt(hotelMainDescriptionModel.decodableHotelMainDescriptionModel.minimal_price))
            
            numberFormatter.locale = .current
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " "
            
            let collectionAttributedString = NSMutableAttributedString(string: .emptyString)
            let priceAttributedString = NSAttributedString(
                string: "\(numberFormatter.string(from: price) ?? .emptyString)₽",
                attributes: [.font: UIFont.boldSystemFont(ofSize: 30), .foregroundColor: UIColor.black])
            let priceForItAttributedString = NSAttributedString(
                string: "  \(hotelMainDescriptionModel.decodableHotelMainDescriptionModel.price_for_it)",
                attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.systemGray])
            
            collectionAttributedString.append(priceAttributedString)
            collectionAttributedString.append(priceForItAttributedString)
            
            return collectionAttributedString
            
        default: return .none
        }
    }
}
