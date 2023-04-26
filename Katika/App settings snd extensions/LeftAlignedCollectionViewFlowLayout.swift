import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout
{
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin : CGFloat = sectionInset.left
        
//        headerReferenceSize = CGSize (width: collectionView!.bounds.size.width, height: 48)
        
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
                    if layoutAttribute.representedElementCategory == .cell {
            if Int(layoutAttribute.frame.origin.y) >= Int(maxY) {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }
        }
        return attributes
    }
}
