import Foundation

struct DecodableHotelMainDescriptionModel: Decodable {
    let name: String
    let address: String?
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let ratingName: String?
    let image_urls: [String]
    let about_the_hotel: DecodableHotelDescription
}

struct DecodableHotelDescription: Decodable {
    let description: String
    let peculiarities: [String]
}
