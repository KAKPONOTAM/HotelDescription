import UIKit

enum ModuleColors {
    case darkYellow // gradeLabelTextColor(HotelRatingTableViewCell)
    case lightYellow // containerView backgroundColor(HotelRatingTableViewCell)
    case lightGray //AboutHotelCell using dat color
    
    private var color: UIColor {
        switch self {
        case .darkYellow:
            return UIColor(red: 255, green: 168, blue: .zero, alpha: 1)
            
        case .lightYellow:
            return UIColor(red: 255, green: 199, blue: .zero, alpha: 0.2)
            
        case .lightGray:
            return UIColor(red: 251, green: 251, blue: 252, alpha: 1)
        }
    }
    
    static func retrieveColor(with moduleColor: Self) -> UIColor {
        return moduleColor.color
    }
}
