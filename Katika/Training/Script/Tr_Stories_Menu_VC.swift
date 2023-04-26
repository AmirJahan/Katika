//import UIKit
//
//class Tr_Stories_Menu_VC: UIViewController,
//    UITableViewDelegate,
//    UITableViewDataSource
//{
//    @IBOutlet weak var trStoriesMenuTableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.title = "Trainings"
//               
//        trStoriesMenuTableView.dataSource = self
//        trStoriesMenuTableView.delegate = self
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        
//        for i in 0..<TrainingData.trainingsStoriesArr.count
//        {
//            let ip = IndexPath(row: i, section: 0)
//            trStoriesMenuTableView.deselectRow(at: ip,
//                                           animated: false)
//        }
//        
//    }
//    
//    
//    func tableView(_ tableView: UITableView,
//                   numberOfRowsInSection section: Int) -> Int
//    {
//        return TrainingData.trainingsStoriesArr.count
//    }
//    
//    func tableView(_ tableView: UITableView,
//                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell: Tr_Stories_MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "trainingsStoriesMenuCell") as! Tr_Stories_MenuTableViewCell
//        
//        let thisStory = TrainingData.trainingsStoriesArr[indexPath.row]
//        
//        cell.bg.layer.cornerRadius = 4.0
//        cell.bg.clipsToBounds = true
//        cell.title.text = thisStory.title
//        
//        
//        return cell
//    }
//    
//    
//    func tableView(_ tableView: UITableView,
//                   didSelectRowAt indexPath: IndexPath)
//    {
//        self.performSegue(withIdentifier: "TrStoriesKeywordsSegue",
//                          sender: indexPath)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue,
//                          sender: Any?)
//    {
//        if ( segue.identifier == "TrStoriesKeywordsSegue")
//        {
//            let indexPath = sender as! IndexPath
//            let thisProject = TrainingData.trainingsStoriesArr[indexPath.row]
//            
//            let keywordCtrl = segue.destination as! Tr_Stories_Keywords_VC
//            
//            keywordCtrl.project = thisProject
//        }
//    }
//    
//}
