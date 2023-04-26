import UIKit

class ScriptCommentsTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var commentDate: UILabel!
    
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
