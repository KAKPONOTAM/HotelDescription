import UIKit

enum HotelDescriptionSections: CaseIterable {
    case hotelImages
    case hotelGrade
    case hotelName
    case hotelAddress
    case tourPrice
    case peculiarities
    case hotelDescription
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
            
        default: return .none
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
            
        default: return .emptyString
        }
    }
    
    var hotelOfferSubTitle: String {
        return "Самое необходимое"
    }
}
