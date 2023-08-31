import UIKit

final class LeftPaddingFlowLayout: UICollectionViewFlowLayout {
    private let cellSpacing: CGFloat = 10
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.sectionInset = UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = .zero
        
        attributes?.forEach {
            if $0.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            
            $0.frame.origin.x = leftMargin
            leftMargin += $0.frame.width + cellSpacing
            maxY = max($0.frame.maxY, maxY)
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
