import Foundation

extension URL {
    enum DefaultURLS {
        case hotelsData
        
        var defaultURLAbsoluteString: String {
            switch self {
            case .hotelsData:
                return "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
            }
        }
    }
}
