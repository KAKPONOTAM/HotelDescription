import Foundation

enum ModuleTitles {
    case hotel
    case aboutHotel
    case selectRoom
    
    private var title: String? {
        switch self {
        case .hotel:
            return "Отель"
            
        case .aboutHotel:
            return "Об отеле"
            
        case .selectRoom:
            return "К выбору номера"

        }
    }
    
    static func retrieveTitle(for moduleTitle: Self) -> String? {
        return moduleTitle.title
    }
}
