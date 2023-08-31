import UIKit

final class HotelMainDescriptionViewController: UIViewController {
    
    private lazy var hotelTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HotelImagesTableViewCell.self, forCellReuseIdentifier: HotelImagesTableViewCell.reuseIdentifier)
        
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HotelMainDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
