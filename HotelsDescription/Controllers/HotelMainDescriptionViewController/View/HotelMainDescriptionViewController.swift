import UIKit
import SnapKit

final class HotelMainDescriptionViewController: UIViewController {
    private var presenter: HotelMainDescriptionPresenterProtocol?
    
    private lazy var hotelTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HotelImagesTableViewCell.self, forCellReuseIdentifier: HotelImagesTableViewCell.reuseIdentifier)
        tableView.register(HotelRatingTableViewCell.self, forCellReuseIdentifier: HotelRatingTableViewCell.reuseIdentifier)
        tableView.register(HotelDescriptionTableViewCell.self, forCellReuseIdentifier: HotelDescriptionTableViewCell.reuseIdentifier)
        tableView.register(HotelOfferTableViewCell.self, forCellReuseIdentifier: HotelOfferTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    private let selectRoomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = HotelMainDescriptionViewConstants.selectRoomButtonCornerRadius
        button.titleLabel?.font = .systemFont(ofSize: HotelMainDescriptionViewConstants.selectRoomButtonLabelFontSize)
        button.setTitleColor(.white, for: .normal)
        button.setTitle(ModuleTitles.retrieveTitle(for: .selectRoom), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        setupConstraints()
        
        title = ModuleTitles.retrieveTitle(for: .hotel)
    }
}

extension HotelMainDescriptionViewController {
    private func addSubview() {
        view.addSubview(hotelTableView)
        view.addSubview(selectRoomButton)
    }
    
    private func setupConstraints() {
        hotelTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalTo(selectRoomButton.snp.top).offset(-HotelMainDescriptionViewConstants.defaultBottomOffset)
            $0.leading.trailing.equalToSuperview().inset(HotelMainDescriptionViewConstants.defaultInset)
        }
        
        selectRoomButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(HotelMainDescriptionViewConstants.defaultInset)
            $0.bottom.equalToSuperview().inset(HotelMainDescriptionViewConstants.defaultBottomOffset)
            $0.height.equalTo(HotelMainDescriptionViewConstants.heightForSelectRoomButton)
        }
    }
}

extension HotelMainDescriptionViewController: HotelMainDescriptionViewProtocol {}

extension HotelMainDescriptionViewController: PresenterConfigurationProtocol {
    func set(presenter: HotelMainDescriptionPresenterProtocol) {
        self.presenter = presenter
    }
}

extension HotelMainDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return view.singleRow
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.sections.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter else { return UITableViewCell() }
        let section = presenter.sections[indexPath.section]
        let attributedString = presenter.configurePrice(for: section)
        
        switch section {
        case .hotelImages:
            guard let hotelImagesCell = tableView.dequeueReusableCell(withIdentifier: HotelImagesTableViewCell.reuseIdentifier, for: indexPath) as? HotelImagesTableViewCell else { return UITableViewCell() }
            
            hotelImagesCell.set(.hotelImages(images: presenter.hotelMainDescriptionModel.hotelImages))
            
            return hotelImagesCell
            
        case .hotelGrade:
            guard let hotelGradeCell = tableView.dequeueReusableCell(withIdentifier: HotelRatingTableViewCell.reuseIdentifier, for: indexPath) as? HotelRatingTableViewCell else { return UITableViewCell() }
            
            hotelGradeCell.configure(grade: attributedString)
            
            return hotelGradeCell
            
        case .hotelName, .hotelAddress, .tourPrice:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelDescriptionTableViewCell.reuseIdentifier, for: indexPath) as? HotelDescriptionTableViewCell else { return UITableViewCell() }
            
            cell.configure(title: attributedString)
            
            return cell
            
        case .peculiarities:
            guard let hotelPeculiaritiesCell = tableView.dequeueReusableCell(withIdentifier: HotelImagesTableViewCell.reuseIdentifier, for: indexPath) as? HotelImagesTableViewCell else { return UITableViewCell() }
            
            hotelPeculiaritiesCell.set(.hotelPeculiarities(peculiarities: presenter.hotelMainDescriptionModel.decodableHotelMainDescriptionModel.about_the_hotel.peculiarities))
            
            return hotelPeculiaritiesCell
            
        case .hotelDescription:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelDescriptionTableViewCell.reuseIdentifier, for: indexPath) as? HotelDescriptionTableViewCell else { return UITableViewCell() }
            
            cell.configure(title: attributedString)
            
            return cell
            
        case .facilities, .included, .unIncluded:
            guard let hotelOfferCell = tableView.dequeueReusableCell(withIdentifier: HotelOfferTableViewCell.reuseIdentifier, for: indexPath) as? HotelOfferTableViewCell else { return UITableViewCell() }
            
            hotelOfferCell.configure(with: section)
            
            return hotelOfferCell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter else { return .zero }
        let section = presenter.sections[indexPath.section]
        
        switch section {
        case .hotelImages:
            return HotelMainDescriptionViewConstants.heightForHotelImageRow
            
        case .hotelGrade:
            return HotelMainDescriptionViewConstants.heightForHotelGradeRow
            
        case .hotelName, .hotelAddress, .tourPrice, .hotelDescription:
            return UITableView.automaticDimension
            
        case .peculiarities:
            return HotelMainDescriptionViewConstants.heightForPeculiaritiesRow
            
        case .facilities, .included, .unIncluded:
            return HotelMainDescriptionViewConstants.heightForHotelOfferRows
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let presenter else { return nil }
        let section = presenter.sections[section]
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: HotelMainDescriptionViewConstants.headerLabelFontSize)
        label.text = ModuleTitles.retrieveTitle(for: .aboutHotel)
        
        return section == .peculiarities ? label : .none
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let presenter else { return .zero }
        let section = presenter.sections[section]
        
        return section == .peculiarities ? HotelMainDescriptionViewConstants.heightForHeaderInSection : .zero
    }
}

