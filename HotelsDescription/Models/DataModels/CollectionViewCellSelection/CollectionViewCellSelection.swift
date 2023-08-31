import UIKit

// created for reuse single table view cell with different collection view cells
enum CollectionViewCellSelection {
    case hotelImages(images: [UIImage?])
    case hotelPeculiarities(peculiarities: [String])
}
