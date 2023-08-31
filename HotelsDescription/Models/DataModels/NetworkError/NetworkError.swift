import Foundation

enum NetworkError: Error {
    case invalidURL
    case missingData
    case unknownError(description: String)
}
