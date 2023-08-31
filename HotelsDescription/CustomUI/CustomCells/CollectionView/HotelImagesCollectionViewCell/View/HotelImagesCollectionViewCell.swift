import UIKit
import SnapKit

final class HotelImagesCollectionViewCell: UICollectionViewCell {
    private let hotelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = HotelImagesCollectionViewCellConstants.hotelImageViewCornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(image: UIImage?) {
        hotelImageView.image = image
    }
}

extension HotelImagesCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(hotelImageView)
    }
    
    private func setupConstraints() {
        hotelImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
