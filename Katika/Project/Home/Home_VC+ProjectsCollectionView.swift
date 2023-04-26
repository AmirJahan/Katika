import UIKit


extension Home_VC:
    UICollectionViewDelegate,
    UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        var numberOfItems = 0
        if AppData.projects.count > 0
        {
            numberOfItems = AppData.projects.count
            collectionView.backgroundView = nil
        }
        else
        {
            let noDataLabel: UILabel  = UILabel(frame: collectionView.bounds)
            noDataLabel.text          = "No projects yet"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            collectionView.backgroundView  = noDataLabel
        }
        return numberOfItems
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : ProjectsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "projcetCellId", for: indexPath) as! ProjectsCollectionViewCell
        
        
        
        let project = AppData.projects[indexPath.row]
        
        
//        let randomColor = UIColor.random
//        let img = UIImage.imageWithColor(color: randomColor)
        
        
//        let str = "file:///Users/Amir/Library/Developer/CoreSimulator/Devices/47967419-4575-493A-AD53-360E49BCD3B7/data/Containers/Data/Application/A7F20B9F-816B-4F2D-B2B5-545C40165B9E/Documents/Video/Video_EE3FEAC4-3F41-407C-8611-0EB33F2B5A87.jpg"
//        
//        let url = URL (string: str)
//        let img = ReadWrite.imageForUrl(url!)
//        
        cell.mainImage.image =  project.projectImage
        
        
        
        let lengthStr = String(format: "%.1f", project.length)
        cell.durationLabel.text = lengthStr
        cell.numberOfShotsLabel.text = "\(project.shots.count)"
        cell.projectTitle.text = project.title
        
        
        return cell
    }
}
