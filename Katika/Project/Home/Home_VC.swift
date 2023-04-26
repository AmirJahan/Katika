import UIKit

class Home_VC: UIViewController
{
    //    @IBOutlet weak var newProjectButton: UIButton!
    
    @IBOutlet var projectsCollectionView: UICollectionView!
    
        @IBAction func comeBackHere(_ unwindSegue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        prepareProjectsCollectionView ()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
        
        // this is the only place we read the projects
        ReadWrite.readAllProjects()
        
        
        projectsCollectionView.reloadData()
        // when we get here, we should set the current project to nil
        // this is to make sure when we go to title, we know whether
        // we are new or editing
        AppData.curProject = nil
        
        
        if AppData.projects.count > 0
        {
            projectsCollectionView
                .scrollToItem(at: IndexPath(row: 0,
                                            section: 0),
                              at: UICollectionView.ScrollPosition.top,
                              animated: false)
        }
    }
    
    
    
}
