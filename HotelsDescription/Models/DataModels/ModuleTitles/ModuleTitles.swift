import Foundation

enum ModuleTitles {
    case hotel
    case aboutHotel
    
    private var title: String? {
        switch self {
        case .hotel:
            return "Отель"
            
        case .aboutHotel:
            return "Об отеле"
        }
    }
    
    static func retrieveTitle(for moduleTitle: Self) -> String? {
        return moduleTitle.title
    }
}
