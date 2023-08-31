import UIKit
import SnapKit

final class HotelOfferTableViewCell: UITableViewCell {
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: HotelOfferTableViewCellConstants.titleLabelFontSize)
        
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: HotelOfferTableViewCellConstants.subTitleLabelFontSize)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let vectorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = ModuleImages.retrieveImage(with: .vectorImage)
        
        return imageView
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
    
    func configure(with hotelDescriptionSections: HotelDescriptionSections) {
        titleImageView.image = hotelDescriptionSections.hotelOfferTitleImage
        titleLabel.text = hotelDescriptionSections.hotelOfferTitle
        subTitleLabel.text = hotelDescriptionSections.hotelOfferSubTitle
        
        switch hotelDescriptionSections {
        case .unIncluded:
            separatorView.removeFromSuperview()
            
        default: break
        }
    }
}

extension HotelOfferTableViewCell {
    private func addSubview() {
        contentView.addSubview(titleImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(vectorImageView)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(separatorView)
    }
    
    private func setupConstraints() {
        titleImageView.snp.makeConstraints {
            $0.size.equalTo(HotelOfferTableViewCellConstants.defaultSize)
            $0.leading.equalToSuperview().inset(HotelOfferTableViewCellConstants.defaultSideInset)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(titleImageView.snp.trailing).offset(HotelOfferTableViewCellConstants.titleLabelLeadingOffset)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
        }
        
        vectorImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(HotelOfferTableViewCellConstants.defaultSideInset)
            $0.centerY.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(1)
            $0.bottom.trailing.equalToSuperview()
        }
    }
}
