import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    private var presenter: LaunchViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension LaunchViewController: PresenterConfigurationProtocol {
    func set(presenter: LaunchViewPresenterImplementation) {
        self.presenter = presenter
    }
}

