import UIKit
import SnapKit

final class HotelImagesTableViewCell: UITableViewCell {
    private lazy var hotelImagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HotelImagesCollectionViewCell.self, forCellWithReuseIdentifier: HotelImagesCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

extension HotelImagesTableViewCell {
    private func addSubview() {
        contentView.addSubview(hotelImagesCollectionView)
    }
    
    private func setupConstraints() {
        hotelImagesCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension HotelImagesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelImagesCollectionViewCell.reuseIdentifier, for: indexPath) as? HotelImagesCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
}
