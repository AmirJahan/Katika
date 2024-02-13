import UIKit

extension ExportComments_VC {
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            // deleting the comment
            guard let project = AppData.curProject else { return }

            project.videoComments.remove(at: indexPath.row)
            self.exportDelegate!.commentsUpdated()

            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.left)
        }
    }
}
