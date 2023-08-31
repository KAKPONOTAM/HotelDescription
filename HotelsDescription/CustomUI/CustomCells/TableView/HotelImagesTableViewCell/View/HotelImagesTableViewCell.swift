import UIKit
import SnapKit

final class HotelImagesTableViewCell: UITableViewCell {
    private var collectionViewCellSelection: CollectionViewCellSelection = .hotelImages(images: .emptyCollection)
    
    private lazy var hotelImagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HotelImagesCollectionViewCell.self, forCellWithReuseIdentifier: HotelImagesCollectionViewCell.reuseIdentifier)
        collectionView.register(HotelPeculiaritiesCollectionViewCell.self, forCellWithReuseIdentifier: HotelPeculiaritiesCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = .zero
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = .white
        pageControl.clipsToBounds = true
        pageControl.layer.cornerRadius = HotelImagesTableViewCellConstants.pageControlCornerRadius
        
        return pageControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func set(_ collectionViewCellSelection: CollectionViewCellSelection) {
        switch collectionViewCellSelection {
        case .hotelImages(let images):
            self.pageControl.numberOfPages = images.count
            
        case .hotelPeculiarities(_):
            let layout = LeftPaddingFlowLayout()
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.scrollDirection = .vertical
            
            self.hotelImagesCollectionView.collectionViewLayout = layout
        }
        
        self.collectionViewCellSelection = collectionViewCellSelection
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
        switch collectionViewCellSelection {
        case .hotelImages(images: let images):
            return images.count
            
        case .hotelPeculiarities(peculiarities: let peculiarities):
            return peculiarities.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelImagesCollectionViewCell.reuseIdentifier, for: indexPath) as? HotelImagesCollectionViewCell else { return UICollectionViewCell() }
        switch collectionViewCellSelection {
        case .hotelImages(images: let images):
            let hotelImage = images[indexPath.item]
            cell.configure(image: hotelImage)
            
            return cell
            
        case .hotelPeculiarities(peculiarities: let peculiarities):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelPeculiaritiesCollectionViewCell.reuseIdentifier, for: indexPath) as? HotelPeculiaritiesCollectionViewCell else { return UICollectionViewCell() }
            let peculiarity = peculiarities[indexPath.item]
            
            cell.configure(title: peculiarity)
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionViewCellSelection {
        case .hotelImages(_):
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        default: return CGSize()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let count = scrollView.contentOffset.x / contentView.bounds.width
        pageControl.currentPage = Int(count)
    }
}
