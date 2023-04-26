import UIKit

extension Tr_Menu_VC
{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return Training.trainings.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: TrainingMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "trainingsCell") as! TrainingMenuTableViewCell
        
        let training = Training.trainings[indexPath.row]
        
        cell.bgView.layer.cornerRadius = 8.0
        cell.bgView.clipsToBounds = true
        
        cell.titleLabel.layer.cornerRadius = 4.0
        cell.titleLabel.clipsToBounds = true
        cell.titleLabel.text = training.title
        cell.titleLabel.layer.borderWidth = 1.0
        cell.titleLabel.layer.borderColor = UIColor.white.cgColor
        
        cell.descriptionLabel.text = training.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
    {
        let thisTraining = Training.trainings[indexPath.row]
        
        
        popTraining(thisTraining)
//        let storyboard = UIStoryboard(name: thisTraining.storyboard,
//                                      bundle: nil)
//
//        let vc = storyboard.instantiateViewController(withIdentifier: thisTraining.vcId)
//
//        self.navigationController?.pushViewController(vc,
//                                                      animated: true)
    }
    
    func popTraining (_ training: TrainingStep)
    {
        let storyBoard = training.storyboard
        
        
        let id =  training.vcId
        
        let storyboard = UIStoryboard(name: storyBoard,
                                      bundle: nil)
        let popover = storyboard.instantiateViewController(withIdentifier: id)
        
        let popoverSize = self.view.bounds.insetBy(dx: 64, dy: 64)
        
        popover.preferredContentSize = popoverSize.size
        popover.modalPresentationStyle = .popover
        if let presentation = popover.popoverPresentationController
        {
            presentation.sourceRect = CGRect(x: self.view.center.x,
                                             y: self.view.center.y,
                                             width: 0,
                                             height: 0)
            presentation.sourceView = self.view
            presentation.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        self.present(popover,
                     animated: true,
                     completion: nil)
    }
}
