import UIKit

final class HotelDescriptionModel {
    let decodableHotelMainDescriptionModel: DecodableHotelMainDescriptionModel
    let hotelImages: [UIImage?]
    
    init(decodableHotelMainDescriptionModel: DecodableHotelMainDescriptionModel, hotelImages: [UIImage?]) {
        self.decodableHotelMainDescriptionModel = decodableHotelMainDescriptionModel
        self.hotelImages = hotelImages
    }
}
