//
//  HotelMainDescriptionViewModel.swift
//  HotelsDescription
//
//  Created by Сабитов Данил on 31.08.2023.
//

import UIKit

protocol HotelMainDescriptionViewModelProtocol: AnyObject {
    func configurePrice(for hotelDescriptionSections: HotelDescriptionSections,  hotelMainDescriptionModel: HotelDescriptionModel) -> NSMutableAttributedString?
}

final class HotelMainDescriptionViewModelImplementation: HotelMainDescriptionViewModelProtocol {
    func configurePrice(for hotelDescriptionSections: HotelDescriptionSections, hotelMainDescriptionModel: HotelDescriptionModel) -> NSMutableAttributedString? {
        switch hotelDescriptionSections {
        case .hotelName:
            let attributedString = NSMutableAttributedString(
                string: "Steigenberger Makadi",
                attributes: [.font: UIFont.boldSystemFont(ofSize: 22), .foregroundColor: UIColor.black]) // hard code cuz no data in API
            
          return attributedString
            
        case .hotelAddress:
            let attributedString = NSMutableAttributedString(
                string: hotelMainDescriptionModel.decodableHotelMainDescriptionModel.adress,
                attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.blue])
            
            return attributedString
            
        case .tourPrice:
            let numberFormatter = NumberFormatter()
            let price = NSNumber(value: UInt(hotelMainDescriptionModel.decodableHotelMainDescriptionModel.minimal_price))
            
            numberFormatter.locale = .current
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " "
            
            let collectionAttributedString = NSMutableAttributedString(string: .emptyString)
            let priceAttributedString = NSAttributedString(
                string: "\(numberFormatter.string(from: price) ?? .emptyString)₽",
                attributes: [.font: UIFont.boldSystemFont(ofSize: 30), .foregroundColor: UIColor.black])
            
            let priceForItAttributedString = NSAttributedString(
                string: "  \(hotelMainDescriptionModel.decodableHotelMainDescriptionModel.price_for_it)",
                attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.systemGray])
            
            collectionAttributedString.append(priceAttributedString)
            collectionAttributedString.append(priceForItAttributedString)
            
            return collectionAttributedString
            
        case .hotelGrade:
            let ratingName = hotelMainDescriptionModel.decodableHotelMainDescriptionModel.rating_name
            let grade = "\(hotelMainDescriptionModel.decodableHotelMainDescriptionModel.rating)" + " " + ratingName
            let attributedString = NSMutableAttributedString(string: grade)
            
            return attributedString
            
        case .hotelDescription:
            let hotelDescription = hotelMainDescriptionModel.decodableHotelMainDescriptionModel.about_the_hotel.description
            let attributedString = NSMutableAttributedString(
                string: hotelDescription,
                attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black])
            
            return attributedString
            
        default: return .none
        }
    }
}
