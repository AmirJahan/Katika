import UIKit

class ProcessSidebarItemTableViewCell: UITableViewCell
{
    @IBOutlet weak var acronymLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool,
                              animated: Bool)
    {
        super.setSelected(selected,
                          animated: animated)
    }
}
