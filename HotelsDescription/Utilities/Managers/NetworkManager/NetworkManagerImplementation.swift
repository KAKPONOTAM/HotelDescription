import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func downloadInfo<T: Decodable>(urls: URL.DefaultURLS) async throws -> T
}

final class NetworkManagerImplementation {
    func downloadInfo<T: Decodable>(urls: URL.DefaultURLS) async throws -> T {
        guard let url = URL(string: urls.defaultURLAbsoluteString) else { throw NetworkError.invalidURL }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let downloadedModels = try JSONDecoder().decode(T.self, from: data)
            
            return downloadedModels
        } catch {
            throw NetworkError.unknownError(description: error.localizedDescription)
        }
    }
}


