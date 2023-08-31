import Foundation
import UIKit

protocol NetworkManagerProtocol: AnyObject {
    func downloadInfo<T: Decodable>(urls: URL.DefaultURLS) async throws -> T
    func downloadImage(urls: URL.DefaultURLS) async throws -> UIImage?
}

final class NetworkManagerImplementation: NetworkManagerProtocol {
    func downloadInfo<T: Decodable>(urls: URL.DefaultURLS) async throws -> T {
        guard let url = URL(string: URL.retrieveURLString(defaultURLS: urls)) else { throw NetworkError.invalidURL }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let downloadedModels = try JSONDecoder().decode(T.self, from: data)
            
            return downloadedModels
        } catch {
            throw NetworkError.unknownError(description: error.localizedDescription)
        }
    }
    
    func downloadImage(urls: URL.DefaultURLS) async throws -> UIImage? {
           guard let url = URL(string: URL.retrieveURLString(defaultURLS: urls)) else { throw NetworkError.invalidURL }
           let (data, _) = try await URLSession.shared.data(from: url)
           
           return UIImage(data: data)
       }
}


