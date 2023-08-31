import Foundation

extension URL {
    enum DefaultURLS {
        case hotelsData(urlString: String = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3")
        case anyURL(urlString: String)
    }
    
    static func retrieveURLString(defaultURLS: DefaultURLS) -> String {
        switch defaultURLS {
        case .anyURL(let urlString):
            return urlString
            
        case .hotelsData(let urlString):
            return urlString
        }
    }
}
