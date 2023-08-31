import UIKit

enum ModuleImages {
    case launchImage
    case starImage
    
    private var image: UIImage? {
        switch self {
        case .launchImage:
            return UIImage(named: "hotelLaunchImage")
            
        case .starImage:
            return UIImage(named: "starImage")
        }
    }
    
    static func retrieveImage(with moduleImage: Self) -> UIImage? {
        return moduleImage.image
    }
}
