import UIKit

enum HotelOffers: CaseIterable {
    case facilities
    case included
    case unIncluded
    
    var hotelOfferTitleImage: UIImage? {
        switch self {
        case .facilities:
            return UIImage(named: "facilitiesImage")
            
        case .included:
            return UIImage(named: "includedImage")
            
        case .unIncluded:
            return UIImage(named: "unIncludedImage")
        }
    }
    
    var hotelOfferTitle: String {
        switch self {
        case .facilities:
            return "Удобства"
            
        case .included:
            return "Что включено"
            
        case .unIncluded:
            return "Что не включено"
        }
    }
    
    var hotelOfferSubTitle: String {
        return "Самое необходимое"
    }
}
