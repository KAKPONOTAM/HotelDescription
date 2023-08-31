import UIKit

enum ModuleColors {
    case darkYellow // gradeLabelTextColor(HotelRatingTableViewCell)
    case lightYellow // containerView backgroundColor(HotelRatingTableViewCell)
    
    private var color: UIColor {
        switch self {
        case .darkYellow:
            return UIColor(red: 255, green: 168, blue: .zero, alpha: 1)
            
        case .lightYellow:
            return UIColor(red: 255, green: 199, blue: .zero, alpha: 0.2)
        }
    }
    
    static func retrieveColor(with moduleColor: Self) -> UIColor {
        return moduleColor.color
    }
}
