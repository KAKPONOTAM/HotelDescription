import UIKit
import SnapKit

final class HotelRatingTableViewCell: UITableViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ModuleColors.retrieveColor(with: .lightYellow)
        view.layer.cornerRadius = HotelRatingTableViewCellConstants.containerViewCornerRadius
        
        return view
    }()
    
    private let hotelGradeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.textColor = ModuleColors.retrieveColor(with: .darkYellow)
        label.font = .systemFont(ofSize: HotelRatingTableViewCellConstants.hotelGradeLabelfontSize)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(grade: String) {
        let imageAttachment = NSTextAttachment()
        
        imageAttachment.image = ModuleImages.retrieveImage(with: .starImage)
        imageAttachment.bounds = CGRect(x: .zero, y: (containerView.frame.height / 2) - 2, width: HotelRatingTableViewCellConstants.starImageViewSize, height: HotelRatingTableViewCellConstants.starImageViewSize)
        
        let completeText = NSMutableAttributedString(string: .emptyString)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let textAfterIcon = NSAttributedString(string: " \(grade)")
        
        completeText.append(attachmentString)
        completeText.append(textAfterIcon)
        
        self.hotelGradeLabel.attributedText = completeText
    }
}

extension HotelRatingTableViewCell {
    private func addSubview() {
        containerView.addSubview(hotelGradeLabel)
        
        contentView.addSubview(containerView)
        
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        hotelGradeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(HotelRatingTableViewCellConstants.hotelGradeLabelTrailingInset)
            $0.top.bottom.equalToSuperview()
        }
    }
}
