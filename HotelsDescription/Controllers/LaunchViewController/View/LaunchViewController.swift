import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    private var presenter: LaunchViewPresenterProtocol?
    
    private let loader: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .white
        
        return view
    }()
    
    private let launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = ModuleImages.retrieveImage(with: .launchImage)
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        presenter?.downloadHotelDescription()
    }
}

extension LaunchViewController {
    private func addSubview() {
        view.addSubview(loader)
        view.addSubview(launchImageView)
        
        view.bringSubviewToFront(loader)
    }
    
    private func setupConstraints() {
        loader.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        launchImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension LaunchViewController: PresenterConfigurationProtocol {
    func set(presenter: LaunchViewPresenterImplementation) {
        self.presenter = presenter
    }
}

extension LaunchViewController: LaunchViewProtocol {
    func downloadingFinishedWithError() {
        loader.stopAnimating()
    }
    
    func downloadingBegan() {
        loader.startAnimating()
    }
}
