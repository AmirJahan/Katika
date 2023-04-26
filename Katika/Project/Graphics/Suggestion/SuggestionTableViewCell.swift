import UIKit

class SuggestionTableViewCell: UITableViewCell
{
    @IBOutlet weak var imgHolderView: UIView!

    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool,
                              animated: Bool)
    {
        super.setSelected(selected,
                          animated: animated)
    }
}
