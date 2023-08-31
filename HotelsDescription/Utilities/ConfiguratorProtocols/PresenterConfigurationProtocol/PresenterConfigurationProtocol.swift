import Foundation

protocol PresenterConfigurationProtocol: AnyObject {
    associatedtype Presenter
    
    func set(presenter: Presenter)
}
