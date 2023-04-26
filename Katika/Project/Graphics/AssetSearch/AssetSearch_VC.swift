import UIKit


class AssetSearch_VC: UIViewController
{
    @IBOutlet weak var assetsCollectionView: UICollectionView!
    @IBOutlet weak var assetSearchTextField: UITextField!
    var subAssets: Array <SvgFile> = []
    var delegate: SearchedAssetDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
     
        
        assetSearchTextField.addTarget(self, action:
            #selector(textFieldDidChange),
                                       for: .editingChanged)
        
        prepareAssetSearchtextField ()
        
        assetSearchTextField.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        prepareAssetsCollectionView()
        keywordsSearch()
    }
}

