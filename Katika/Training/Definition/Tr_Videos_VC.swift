//import UIKit
//
//class Tr_Videos_VC: UIViewController,
//    UICollectionViewDelegate,
//    UICollectionViewDataSource
//{
//    @IBOutlet weak var videosCollectionView: UICollectionView!
//    
//    var projects : Array<Project> = []
//    
//    func prepareProjects ()
//    {
//        let a = Project(title: "1200px--MotionGraphicsAnimation.webm.jpg")
//        a.mainImageName = "1200px--MotionGraphicsAnimation.webm.jpg"
//        projects.append(a)
//        
//        let b = Project(title: "325495_phpTq9Z5e.png")
//        b.mainImageName = "325495_phpTq9Z5e.png"
//        projects.append(b)
//    }
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//        prepareProjects ()
//        
//        videosCollectionView.delegate = self
//        videosCollectionView.dataSource = self
//        
//        self.view.layoutIfNeeded()
//        let itemsPer = 3
//        let cellWidth = self.videosCollectionView.bounds.width / CGFloat ( itemsPer )
//        
//        let myLayout = UICollectionViewFlowLayout()
//        myLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
//        myLayout.sectionInset = UIEdgeInsets.zero
//        myLayout.minimumInteritemSpacing = 0.0
//        myLayout.minimumLineSpacing = 0.0
//        
//        videosCollectionView.collectionViewLayout = myLayout
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int
//    {
//        return projects.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    {
//        let cell : TrainingVideoCollectionViewCell!
//        
//        cell = collectionView
//            .dequeueReusableCell(withReuseIdentifier: "trainingVideoCell",
//                                 for: indexPath) as? TrainingVideoCollectionViewCell
//        
//        let thisVideo = projects[indexPath.row]
//        
//        cell.backgroundColor = UIColor.lightGray
//        cell.mainIMgView.image = UIImage(named: thisVideo.mainImageName!)
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        didSelectItemAt indexPath: IndexPath)
//    {
//        self.performSegue(withIdentifier: "videoSegue",
//                          sender: indexPath)
//    }
//}
