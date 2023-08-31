import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    private var presenter: LaunchViewPresenterProtocol?
    
    private lazy var hotelTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension LaunchViewController: PresenterConfigurationProtocol {
    func set(presenter: LaunchViewPresenterImplementation) {
        self.presenter = presenter
    }
}

extension LaunchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
