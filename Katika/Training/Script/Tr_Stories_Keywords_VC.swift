//import UIKit
//
//class Tr_Stories_Keywords_VC: UIViewController,
//    UICollectionViewDelegate,
//    UICollectionViewDataSource,
//    UICollectionViewDelegateFlowLayout
//{
//    public var project: Project?
//    
//    @IBOutlet weak var projectTitleLabel: UILabel!
//    @IBOutlet weak var keywordsCollectionView: UICollectionView!
//    
//    let labelsFontAttr = UIFont.boldSystemFont(ofSize: 54)
//    let labelsFont = UIFont.boldSystemFont(ofSize: 22)
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//        self.title = "Project Keywords"
//        
//        projectTitleLabel.text = "Keywords of \(project!.title)"
//        
//        keywordsCollectionView.delegate = self
//        keywordsCollectionView.dataSource = self
//        
////        keywordsCollectionView.layout
//        
////        self.view.layoutIfNeeded()
////        let itemsPer = 6
////        let cellWidth = self.keywordsCollectionView.bounds.width / CGFloat ( itemsPer )
////
////        let myLayout = UICollectionViewFlowLayout()
////        myLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
////        myLayout.sectionInset = UIEdgeInsets.zero
////        myLayout.minimumInteritemSpacing = 5.0
////        myLayout.minimumLineSpacing = 5.0
////
////
////        keywordsCollectionView.collectionViewLayout = myLayout
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//          // dataArary is the managing array for your UICollectionView.
//        let labelText = project?.keywords[indexPath.row]
////        let label = UILabel(frame: CGRect.zero)
////        label.font = labelsFont
////        label.text = labelText
////        label.sizeToFit()
//        
//
//        
//        let itemSize = labelText?.size(withAttributes: [
//            NSAttributedString.Key.font : labelsFont
//        ])
////
//        let uItemSize = CGSize(width: itemSize!.width + 20,
//                               height: 64)
//        
//        return uItemSize
//        
////        let retSize = CGSize(width: label.frame.width, height: 44)
////        label.frame.size = retSize
////        return itemSize ?? CGSize.zero
////        return retSize
////
//        
//        
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int
//    {
//        return project?.keywords.count ?? 0
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    {
//        let cell : Tr_Story_KeywordsCollectionViewCell!
//        
//        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "keywordCell",
//                                                  for: indexPath) as? Tr_Story_KeywordsCollectionViewCell
//
//        
//        
//        let thisLabel = project?.keywords[indexPath.row]
//        
//        cell.label.text = thisLabel
//        cell.label.font = labelsFont
//        cell.label.backgroundColor = UIColor.cyan
//        cell.backgroundColor = UIColor.lightGray
//        cell.layer.cornerRadius = 12.0
//        
//        return cell
//    }
//    
//}
//
