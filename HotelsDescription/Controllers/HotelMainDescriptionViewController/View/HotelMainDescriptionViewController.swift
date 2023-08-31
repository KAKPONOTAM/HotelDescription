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
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        setupConstraints()
        
        title = "Отель"
    }
}

extension HotelMainDescriptionViewController {
    private func addSubview() {
        view.addSubview(hotelTableView)
    }
    
    private func setupConstraints() {
        hotelTableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(HotelMainDescriptionViewConstants.hotelTableViewSideInset)
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
        guard let presenter else { return .zero }
        let section = presenter.scrollConfigurationTuple.sections[section]
        
        switch section {
        case .hotelImages:
            return view.singleRow
            
        case .hotelGrade:
            return view.singleRow

        case .hotelAddressAndPrice:
            return view.singleRow

        case .peculiarities:
            return view.singleRow

        case .hotelDescription:
            return view.singleRow

        case .hotelOffers:
            return presenter.scrollConfigurationTuple.rows.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.scrollConfigurationTuple.sections.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter else { return UITableViewCell() }
        let section = presenter.scrollConfigurationTuple.sections[indexPath.section]
        
        switch section {
        case .hotelImages:
            guard let hotelImagesCell = tableView.dequeueReusableCell(withIdentifier: HotelImagesTableViewCell.reuseIdentifier, for: indexPath) as? HotelImagesTableViewCell else { return UITableViewCell() }
            
            hotelImagesCell.set(images: presenter.hotelMainDescriptionModel.hotelImages)
            
            return hotelImagesCell
            
        case .hotelGrade:
            guard let hotelGradeCell = tableView.dequeueReusableCell(withIdentifier: HotelRatingTableViewCell.reuseIdentifier, for: indexPath) as? HotelRatingTableViewCell else { return UITableViewCell() }
            let ratingName = presenter.hotelMainDescriptionModel.decodableHotelMainDescriptionModel.rating_name
            let grade = "\(presenter.hotelMainDescriptionModel.decodableHotelMainDescriptionModel.rating)" + " " + ratingName
            
            hotelGradeCell.configure(grade: grade)
            
            return hotelGradeCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter else { return .zero }
        let section = presenter.scrollConfigurationTuple.sections[indexPath.section]
        
        switch section {
        case .hotelImages:
            return HotelMainDescriptionViewConstants.heightForHotelImageRow
            
        case .hotelGrade:
            return HotelMainDescriptionViewConstants.heightForHotelGradeRow
            
        default: return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let presenter else { return nil }
        let section = presenter.scrollConfigurationTuple.sections[section]
        let view = UIView()
        view.backgroundColor = .clear
        
        switch section {
        case .hotelGrade:
            return view
            
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .zero
    }
}

