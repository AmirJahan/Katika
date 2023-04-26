//import UIKit
//
//class Tr_Stories_UserKeywords_VC: UIViewController,
//    UICollectionViewDelegate,
//    UICollectionViewDataSource,
//    UICollectionViewDelegateFlowLayout,
//    UITextFieldDelegate
//{
//    @IBOutlet weak var nwKeywordTextField: UITextField!
//    @IBOutlet weak var keywordsCollectionView: UICollectionView!
//    
//    let labelsFont = UIFont.boldSystemFont(ofSize: 22)
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//        self.title = "New Project Keywords"
//        
//        keywordsCollectionView.delegate = self
//        keywordsCollectionView.dataSource = self
//        nwKeywordTextField.delegate = self
//        
//        AppData.curProject = Project(title: "Unnamed Project")
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool
//    {
//        if ( textField == nwKeywordTextField &&
//            textField.text != "")
//        {
//            let newKeyword = textField.text!
//            AppData.curProject!.keywords.append(newKeyword)
//            keywordsCollectionView.reloadData()
//        }
//        
//        return true
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        // dataArary is the managing array for your UICollectionView.
//        let labelText = AppData.curProject!.keywords[indexPath.row]
//        //        let label = UILabel(frame: CGRect.zero)
//        //        label.font = labelsFont
//        //        label.text = labelText
//        //        label.sizeToFit()
//        
//        
//        
//        let itemSize = labelText.size(withAttributes: [
//            NSAttributedString.Key.font : labelsFont
//        ])
//        //
//        let uItemSize = CGSize(width: itemSize.width + 20,
//                               height: 64)
//        
//        return uItemSize
//        
//        
//        
//    }
//    
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
//        let thisLabel = AppData.curProject?.keywords[indexPath.row]
//        
//        cell.label.text = thisLabel
//        cell.label.font = labelsFont
//        cell.layer.backgroundColor = UIColor.lightGray.cgColor
//        cell.layer.cornerRadius = 12.0
//        
//        return cell
//    }
//}
