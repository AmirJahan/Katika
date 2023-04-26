import UIKit

extension Script_VC:
    UITableViewDelegate,
    UITableViewDataSource
{
    // MARK: TABLE of Recordings
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return AppData.curProject!.voiceOvers.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var numOfSections: Int = 0
        
        guard let vos = AppData.curProject?.voiceOvers else { return 0 }
        
        if vos.count > 0
        {
            tableView.separatorStyle = .singleLine
            numOfSections            = 1
            tableView.backgroundView = nil
        }

        return numOfSections
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordingCell")
        
        let thisVoiceover = AppData.curProject!.voiceOvers[indexPath.row]
        
        //        let audioAsset = AVURLAsset.init(url: thisVoiceover.url!,
        //                                         options: nil)
        let duration = thisVoiceover.duration
        //        let durationInSeconds = CMTimeGetSeconds(duration)
        let durationString = String(format: "%.1f", duration)
        
        
        cell?.textLabel?.text = String (format: "Voice Over %02d", indexPath.row + 1)
        cell?.detailTextLabel?.text = durationString + " Seconds"
        cell?.textLabel?.textColor = UIColor.black
        cell?.backgroundColor = UIColor.clear
        
        if ( thisVoiceover.selected)
        {
            cell?.textLabel?.text = String (format: "Selected", indexPath.row)
            cell?.textLabel?.textColor = UIColor.red
            cell?.backgroundColor = UIColor.lightGray
        }

        return cell!
    }
    
    
    
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
    {
        for i in 0..<(AppData.curProject?.voiceOvers.count)!
        {
            AppData.curProject!.voiceOvers[i].selected = false
        }
        
        AppData.curProject?.voiceOvers[indexPath.row].selected = true
        
        
        
//        dump (AppData.curProject?.voiceOvers[indexPath.row])
        
        if let vo = AppData.curProject?.voiceOvers[indexPath.row]
        {
            self.play(voiceOver: vo)
        }
        
        tableView.reloadData()
        
        saveScript ()
        
    }
    
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            AppData.curProject!.voiceOvers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.fade)
            tableView.reloadData()
            saveScript ()
        }
    }
}
