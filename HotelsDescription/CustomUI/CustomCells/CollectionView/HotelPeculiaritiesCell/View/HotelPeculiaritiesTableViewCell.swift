import UIKit
import SnapKit

final class HotelPeculiaritiesCollectionViewCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .left
        label.backgroundColor = .systemGray6
        label.numberOfLines = .zero
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 16)
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(title: String?) {
        self.titleLabel.text = title
    }
}

extension HotelPeculiaritiesCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
