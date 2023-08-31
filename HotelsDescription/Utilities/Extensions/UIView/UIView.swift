import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    var singleRow: Int {
        return 1
    }
}
