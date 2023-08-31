import UIKit

enum ModuleImages {
    case launchImage
    case starImage
    case vectorImage
    
    private var image: UIImage? {
        switch self {
        case .launchImage:
            return UIImage(named: "hotelLaunchImage")
            
        case .starImage:
            return UIImage(named: "starImage")
            
        case .vectorImage:
            return UIImage(named: "vectorImage")
        }
    }
    
    static func retrieveImage(with moduleImage: Self) -> UIImage? {
        return moduleImage.image
    }
}
