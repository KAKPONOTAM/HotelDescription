import UIKit
import SnapKit

final class HotelImagesTableViewCell: UITableViewCell {
    private var hotelImages: [UIImage?] = .emptyCollection
    
    private lazy var hotelImagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = HotelImagesTableViewCellConstants.hotelImagesCollectionViewMinimumLineSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HotelImagesCollectionViewCell.self, forCellWithReuseIdentifier: HotelImagesCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = .zero
        pageControl.pageIndicatorTintColor = .black
        pageControl.backgroundColor = .white
        pageControl.clipsToBounds = true
        pageControl.layer.cornerRadius = HotelImagesTableViewCellConstants.pageControlCornerRadius
        
        return pageControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func set(images: [UIImage?]) {
        self.hotelImages = images
        self.pageControl.numberOfPages = images.count
        
        hotelImagesCollectionView.reloadData()
    }
}

extension HotelImagesTableViewCell {
    private func addSubview() {
        contentView.addSubview(hotelImagesCollectionView)
        contentView.addSubview(pageControl)
        
        contentView.bringSubviewToFront(pageControl)
    }
    
    private func setupConstraints() {
        hotelImagesCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(HotelImagesTableViewCellConstants.pageControlBottomInset)
            $0.centerX.equalToSuperview()
        }
    }
}

extension HotelImagesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelImagesCollectionViewCell.reuseIdentifier, for: indexPath) as? HotelImagesCollectionViewCell else { return UICollectionViewCell() }
        let hotelImage = hotelImages[indexPath.item]
        
        cell.configure(image: hotelImage)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - HotelImagesTableViewCellConstants.hotelImagesCollectionViewMinimumLineSpacing, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let count = scrollView.contentOffset.x / contentView.bounds.width
        pageControl.currentPage = Int(count)
    }
}
