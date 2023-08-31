import Foundation

struct DecodableHotelMainDescriptionModel: Decodable {
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: DecodableHotelDescription
    let peculiarities: [String]?
}

struct DecodableHotelDescription: Decodable {
    let description: String
    let peculiarities: [String]
}
