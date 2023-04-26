
import UIKit

class ShotTableViewCell: UITableViewCell
{
    @IBOutlet weak var shotImgView: UIImageView!
    @IBOutlet weak var shotNumberLabel: UILabel!
    @IBOutlet weak var shotScriptTextView: UITextView!
    @IBOutlet weak var shotDurationLabel: UILabel!
    @IBOutlet weak var shotNoGraphicsLabel: UILabel!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool,
                              animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
