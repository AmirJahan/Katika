//import UIKit
//
//class TrainingShotsVC: UIViewController,
//    UITableViewDelegate,
//    UITableViewDataSource
//{
//    @IBOutlet weak var trainingShotsTableView: UITableView!
//    
//    var shots : [Shot] = [/*
//        Shot(number: 1, script: nil, duration: 6.5),
//        Shot(number: 2, script: nil, duration: 6.1),
//        Shot(number: 3, script: nil, duration: 3.9),
//        Shot(number: 4, script: nil, duration: 8.5),
//        Shot(number: 5, script: nil, duration: 1.6),
//        Shot(number: 6, script: nil, duration: 2.3),
//        Shot(number: 7, script: nil, duration: 3.3),
//        Shot(number: 8, script: nil, duration: 9.2),
//        Shot(number: 9, script: nil, duration: 8.5),*/]
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//        self.title = "Shots in a video"
//        
//        trainingShotsTableView.delegate = self
//        trainingShotsTableView.dataSource = self
//        
//    }
//    
//    func tableView(_ tableView: UITableView,
//                   numberOfRowsInSection section: Int) -> Int
//    {
//        return shots.count
//    }
//    
//    func tableView(_ tableView: UITableView,
//                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell : ShotTableViewCell = tableView.dequeueReusableCell(withIdentifier: "shotCell") as! ShotTableViewCell
//        
//               
//        let thisShot : Shot = shots[indexPath.row]
//        
//        if let img = thisShot.img {
//            cell.shotImgView.image = img
//            cell.shotNoGraphicsLabel.isHidden = true
//        }
//        else
//        {
//            cell.shotNoGraphicsLabel.isHidden = false
//             cell.shotImgView?.backgroundColor = UIColor.random
//        }
//        
//
//        cell.shotNumberLabel?.text
//            = "Shot \(thisShot.number!)"
//        
//        cell.shotDurationLabel?.text
//            = "\(thisShot.duration!) seconds"
//        
//         
//       
//        
//        return cell
//    }
//    
//     func tableView(_ tableView: UITableView,
//                   didSelectRowAt indexPath: IndexPath)
//    {
//        self.performSegue(withIdentifier: "shotSegue",
//                          sender: indexPath)
//        
//    }
//}
