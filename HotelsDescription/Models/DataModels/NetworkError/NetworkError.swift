import Foundation

enum NetworkError: Error {
    case invalidURL
    case missingData
    case unknownError(description: String)
    
    var errorTitle: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
            
        case .missingData:
            return "Something went wrong. Please try again later. Looks like we missing any data."
            
        case .unknownError(let description):
            return "Unknown error" + " " + description
        }
    }
}
