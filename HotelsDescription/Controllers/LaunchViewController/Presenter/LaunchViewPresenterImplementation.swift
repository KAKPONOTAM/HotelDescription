import UIKit

protocol LaunchViewPresenterProtocol: AnyObject {
    func downloadHotelDescription()
}

protocol LaunchViewProtocol: AnyObject {
    func downloadingBegan()
    func downloadingFinishedWithError()
}

final class LaunchViewPresenterImplementation: LaunchViewPresenterProtocol {
    private weak var viewController: LaunchViewProtocol?
    private let router: HandlingRouter
    private let networkManager: NetworkManagerProtocol
    
    init(viewController: LaunchViewProtocol?, networkManager: NetworkManagerProtocol, router: HandlingRouter) {
        self.viewController = viewController
        self.networkManager = networkManager
        self.router = router
    }
    
    func downloadHotelDescription() {
        viewController?.downloadingBegan()
        
        Task {
            do {
                var images: [UIImage?] = .emptyCollection
                let decodableHotelMainDescriptionModel: DecodableHotelMainDescriptionModel = try await networkManager.downloadInfo(urls: .hotelsData())
                
                for imageURL in decodableHotelMainDescriptionModel.image_urls {
                    let image = try await networkManager.downloadImage(urls: .anyURL(urlString: imageURL))
                    images.append(image)
                }
                
                await MainActor.run { [images] in
                    let hotelMainDescriptionModel = HotelDescriptionModel(
                        decodableHotelMainDescriptionModel: decodableHotelMainDescriptionModel,
                        hotelImages: images)
                    
                    router.changeMainModule(hotelDescriptionModel: hotelMainDescriptionModel)
                }
                
            } catch let error as NetworkError {
                await MainActor.run {
                    viewController?.downloadingFinishedWithError()
                    router.handleError(title: "Sorry!", message: error.errorTitle)
                }
            }
        }
    }
}
