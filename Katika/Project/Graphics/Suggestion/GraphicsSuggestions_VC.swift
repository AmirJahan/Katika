import UIKit

class GraphicsSuggestions_VC:
    UIViewController
{
    @IBOutlet weak var suggestionsTableView: UITableView!
    var shot: Shot!
       
    var suggestionDelegate: SuggestionDelegate!
    

    override func viewDidLoad()
    {
        self.navigationController?.navigationBar.isHidden = true

        suggestionsTableView.delegate = self
        suggestionsTableView.dataSource = self
        
        print ("shot img is: \(shot.artworkSet.imgName)")
              
        
        for set in shot.suggestions
        {
            print("sug name is: \(set.imgName)")
        }
        
             
        
    }
}

