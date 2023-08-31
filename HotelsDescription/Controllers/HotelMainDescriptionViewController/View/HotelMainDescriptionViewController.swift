import UIKit
import SnapKit

final class HotelMainDescriptionViewController: UIViewController {
    private var presenter: HotelMainDescriptionPresenterProtocol?
    
    private lazy var hotelTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HotelImagesTableViewCell.self, forCellReuseIdentifier: HotelImagesTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        setupConstraints()
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
            return presenter.hotelMainDescriptionModel.hotelImages.count
            
        case .hotelAddress:
            return view.singleRow
            
        case .tourPrice:
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
        return UITableViewCell()
    }
}

