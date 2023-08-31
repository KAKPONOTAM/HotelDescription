import UIKit

final class HotelImagesCollectionViewCell: UICollectionViewCell {
    private let hotelImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = .zero
        
        return pageControl
    }()
    
    func configure(image: UIImage?, imagesCount: Int) {
        hotelImageView.image = image
        pageControl.numberOfPages = imagesCount
    }
}
