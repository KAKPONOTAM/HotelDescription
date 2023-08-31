import UIKit

enum ModuleImages {
    case launchImage
    
    private var image: UIImage? {
        switch self {
        case .launchImage:
            return UIImage(named: "hotelLaunchImage")
        }
    }
    
    static func retrieveImage(with moduleImage: Self) -> UIImage? {
        return moduleImage.image
    }
}
