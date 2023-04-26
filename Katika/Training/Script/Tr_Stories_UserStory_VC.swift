//import UIKit
//
//class Tr_Stories_UserStory_VC: UIViewController,
//    UICollectionViewDelegate,
//    UICollectionViewDataSource,
//    UICollectionViewDelegateFlowLayout
//{
//    @IBOutlet weak var storyTextView: UITextView!
//    @IBOutlet weak var keywordsCollectionView: UICollectionView!
//    
//    let labelsFontAttr = UIFont.boldSystemFont(ofSize: 44)
//    let labelsFont = UIFont.boldSystemFont(ofSize: 14)
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//        self.title = "New Project Story"
//        
//               keywordsCollectionView.delegate = self
//        keywordsCollectionView.dataSource = self
//    }
//     
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//           // dataArary is the managing array for your UICollectionView.
//        let labelText = AppData.curProject!.keywords[indexPath.row]
//          //        let label = UILabel(frame: CGRect.zero)
//          //        label.font = labelsFont
//          //        label.text = labelText
//          //        label.sizeToFit()
//                  
//
//                  
//                  let itemSize = labelText.size(withAttributes: [
//                      NSAttributedString.Key.font : labelsFont
//                  ])
//          //
//                  let uItemSize = CGSize(width: itemSize.width + 20,
//                                         height: 64)
//                  
//                  return uItemSize
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int
//    {
//        return AppData.curProject?.keywords.count ?? 0
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
//        let thisLabel = AppData.curProject?.keywords[indexPath.row]
//        
//        cell.label.text = thisLabel
//        cell.label.font = labelsFont
//        cell.layer.backgroundColor = UIColor.lightGray.cgColor
//        cell.layer.cornerRadius = 12.0
//        
//        return cell
//    }
//    
//}
//
